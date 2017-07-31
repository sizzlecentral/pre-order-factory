class Batch < ApplicationRecord

	validates :start_date, :end_date, :min_quantity, presence: true
	validates :min_quantity, numericality: { greater_than: 0 }

	validate  :validate_no_current_preorder_campaign, on: :create
	validate  :valid_start_date, on: :create
	validate  :validate_no_overlap, on: :create
	validate  :valid_end_date

	def validate_no_current_preorder_campaign
		if end_date?
			productBatches = Batch.where(product_id: product_id)
			productBatches.each do |batch|
				if batch.end_date > Date.today
					errors.add(:active, "There is already a current campaign underway for this product, batch #{batch.id} ending on #{batch.end_date}")
				else
					return true
				end
			end
		else
			errors.add(:end_date, ' must exist')
		end
	end

	def validate_no_overlap
		if end_date? && start_date?
			productBatches = Batch.where(product_id: product_id)
			productBatches.each do |batch|
				if (start_date..end_date).overlaps?(batch.start_date..batch.end_date)
					errors.add(:start_date, "This time frame overlaps with batch #{batch.id}")
				else
					return true
				end
			end
		else
			errors.add(:end_date, ' must exist')
			errors.add(:start_date, ' must exist')
		end
	end

	def valid_start_date
		if start_date?
			validation = start_date.to_time
			if validation < Date.today
				errors.add(:start_date, ' must be in the future')
			else
				return true
			end
		else
			errors.add(:start_date, ' must exist')
		end
	end

	def valid_end_date
		if end_date?
			validation = end_date.to_time
			if validation.past?
				errors.add(:end_date, 'must be in the future')
			elsif validation < start_date.to_time
				errors.add(:end_date, 'must be after start date')
			else
				return true
			end
		else
			errors.add(:end_date, ' must exist')
		end
	end

end

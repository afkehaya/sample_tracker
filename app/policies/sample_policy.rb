class SamplePolicy < ApplicationPolicy
	def index?
		true
	end 
	
	def update?
		user.present? 
	end

	def create?
		return true if user.present? && user.admin?
	end
	def admin_only?
		return true if user.present? && user.admin?
	end
	def new
		create?
	end

	def delete?
		false
	end


	private

	def sample
		record
	end
end

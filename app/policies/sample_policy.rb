class SamplePolicy < ApplicationPolicy
	def index?
		true
	end
	def home?
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
	end

	def delete?
		user.present? && user.admin?
	end


	private

	def sample
		record
	end
end

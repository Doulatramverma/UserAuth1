module ApplicationHelper
   # def resource_name
   #   :user
   #  end

   #  def resource
   #   @resource ||= User.new
   #  end

   #  def devise_mapping
   #   @devise_mapping ||= Devise.mappings[:user]
   #  end


    def user_permission_admin?
       if current_user
         UserRole.find(current_user.role_id).role_name == "Admin"
       else
       false
       end
    end

    def user_permission_manager?
       if current_user
         UserRole.find(current_user.role_id).role_name == "Manager" && User.all.map(&:company_id) == current_user.company_id
       else
           false
       end
    end

    def user_permission_user?
       if current_user
         UserRole.find(current_user.role_id).role_name == "User"
       else
       false
       end
    end

    def user_check(user1, curr_user)
        if UserRole.find(curr_user.role_id).role_name == "Manager"
            if  user1.company_id == curr_user.company_id
              true
            else
              false
            end
        elsif UserRole.find(curr_user.role_id).role_name == "Admin"


        else


        end
    end
end

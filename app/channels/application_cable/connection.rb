module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_member

    def connect
      self.current_member = Member.find_by(id: cookies.signed[:member_id])
      reject_unauthorized_connection unless current_member
    end
  end
end

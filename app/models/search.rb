class Search < ApplicationRecord

  def tickets
    @tickets ||= find_tickets
  end

  def coupons
    @coupons ||= find_coupons
  end

  def railtickets
    @railtickets ||= find_railtickets
  end

  def parktickets
    @parktickets ||= find_parktickets
  end

  def metros
    @metros ||= find_metros
  end

private

  def find_tickets
    tickets = Ticket.order(:flight_date)
    tickets = tickets.where("airline like ?", "%#{airline}%") if airline.present?
    tickets = tickets.where("flight_no like ?", "%#{flight_no}%") if flight_no.present?
    tickets = tickets.where("destination like ?", "%#{destination}%") if destination.present?
    tickets = tickets.where("flight_date >= ?", date_from) if date_from.present?
    tickets = tickets.where("flight_date <= ?", date_to) if date_to.present?
    tickets = tickets.where("price >= ?", min_price) if min_price.present?
    tickets = tickets.where("price <= ?", max_price) if max_price.present?
    tickets
  end

  def find_coupons
    coupons = Coupon
    coupons = coupons.where("airline like ?", "%#{airline}%") if airline.present?
    coupons = coupons.where("destination like ?", "%#{destination}%") if destination.present?
    coupons = coupons.where("flight_date_from >= ?", date_from ) if date_from.present?
    coupons = coupons.where("flight_date_to<= ?", date_to ) if date_to.present?
    coupons = coupons.where("price >= ?", min_price) if min_price.present?
    coupons = coupons.where("price <= ?", max_price) if max_price.present?
    coupons
  end

  def find_railtickets
    railtickets = Railticket
    railtickets = railtickets.where("train_no like ?", "%#{train_no}%") if train_no.present?
    railtickets = railtickets.where("departure like ?", "%#{departure}%") if departure.present?
    railtickets = railtickets.where("destination like ?", "%#{destination}%") if destination.present?
    railtickets = railtickets.where("train_date >= ?", date_from ) if date_from.present?
    railtickets = railtickets.where("train_date <= ?", date_to ) if date_to.present?
    railtickets = railtickets .where("price >= ?", min_price) if min_price.present?
    railtickets = railtickets .where("price <= ?", max_price) if max_price.present?
    railtickets
  end

  def find_parktickets
    parktickets = Parkticket
    parktickets = parktickets.where("park_name like ?", "%#{park_name}%") if park_name.present?
    parktickets = parktickets.where("park_expiry_date >= ?", date_from ) if date_from.present?
    parktickets = parktickets.where("park_expiry_date <= ?", date_to ) if date_to.present?
    parktickets = parktickets.where("price >= ?", min_price) if min_price.present?
    parktickets = parktickets.where("price <= ?", max_price) if max_price.present?
    parktickets
  end

  def find_metros
    metros = Metro
    metros = metros.where("ticket_type like ?", "%#{ticket_type}%") if ticket_type.present?
    metros = metros.where("days like ?", "%#{days}%") if days.present?
    metros = metros.where("area like ?", "%#{area}%") if area.present?
    metros = metros.where("date >= ?", date_from ) if date_from.present?
    metros = metros.where("date <= ?", date_to ) if date_to.present?
    metros = metros.where("price >= ?", min_price) if min_price.present?
    metros = metros.where("price <= ?", max_price) if max_price.present?
    metros
  end

end

class AttendancesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @event = Event.find(params[:event_id])
    @attendances = @event.attendances.all
  end

  def show
    @event = Event.find(params[:event_id])
    @attendance = @event.attendances(params[:id])
  end

  def new
    @event = Event.find(params[:event_id])
  end

  def create
    @event = Event.find(params[:event_id])
    @amount = @event.amount

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount.to_s,
      description: 'Rails Stripe customer',
      currency: 'eur',
    })

    @attendance_user = Attendance.create(event: @event, user: current_user, stripe_customer_id: customer.id )
    if @attendance_user.save
      redirect_to event_path(@event), success: "Tu participe désormais à l'évènement #{@event.title}"
    end
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_event_attendance_path
    end

  end
  
  

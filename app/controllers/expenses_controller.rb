class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all

    respond_to do |format|
      format.html
      format.json { render json: @expenses }
    end
  end

  def show
    @expense = Expense.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @expense }
    end
  end

  def new
    @expense = Expense.new

    respond_to do |format|
      format.html
      format.json { render json: @expense }
    end
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def create
    @expense = Expense.new(params[:expense])

    respond_to do |format|
      if @expense.save
        format.html { redirect_to expenses_url, notice: 'Your expense is recorded successfully!!' }
        format.json { render json: @expense, status: :created, location: @expense }
      else
        format.html { render action: "new" }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @expense = Expense.find(params[:id])

    respond_to do |format|
      if @expense.update_attributes(params[:expense])
        format.html { redirect_to expenses_url, notice: 'Your expense was updated successfully!!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy

    respond_to do |format|
      format.html { redirect_to expenses_url, notice: 'Your expense is shredded!!' }
      format.json { head :no_content }
      format.js { render :nothing => true }
    end
  end
end

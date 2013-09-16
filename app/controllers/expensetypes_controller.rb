class ExpensetypesController < ApplicationController

  def index
    @expensetypes = Expensetype.all

    respond_to do |format|
      format.html
      format.json { render json: @expensetypes }
      format.xml { render xml: @expensetypes }
    end
  end

  def show
    @expensetype = Expensetype.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @expensetype }
      format.xml { render xml:@expensetype }
    end
  end

  def new
    @expensetype = Expensetype.new

    respond_to do |format|
      format.html
      format.json { render json: @expensetype }
      format.xml { render xml: @expensetype }
    end
  end

  def edit
    @expensetype = Expensetype.find(params[:id])

    respond_to do |format|
      format.html
      format.xml { render xml: @expensetype }
    end
  end

  def create
    @expensetype = Expensetype.new(params[:expensetype])

    respond_to do |format|
      if @expensetype.save
        format.html { redirect_to expensetypes_url, notice: "The new expensetype '#{@expensetype.name}' is added to the system successfully." }
        format.json { render json: @expensetype, status: :created, location: @expensetype }
        format.xml { render xml: @expensetype }
      else
        format.html { render action: "new" }
        format.json { render json: @expensetype.errors, status: :unprocessable_entity }
        format.xml { render xml: @expensetype.errors }
      end
    end
  end

  def update
    @expensetype = Expensetype.find(params[:id])

    respond_to do |format|
      if @expensetype.update_attributes(params[:expensetype])
        format.html { redirect_to expensetypes_url, notice: "Expensetype '#{@expensetype.name}' is updated in the system successfully." }
        format.json { head :no_content }
        format.xml { render :nothing => true }
      else
        format.html { render action: "edit" }
        format.json { render json: @expensetype.errors, status: :unprocessable_entity }
        format.xml { render xml: @expensetype.errors }
      end
    end
  end

  def destroy
    @expensetype = Expensetype.find(params[:id])
    #@expTypName = @expensetype.name
    @expensetype.destroy

    respond_to do |format|
      format.html { redirect_to expensetypes_url }
      format.json { head :no_content }
      format.js { render :nothing => true }
      format.xml { render :nothing => true }
    end
  end
end

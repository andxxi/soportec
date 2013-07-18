class SchedulesController < ApplicationController
  # GET /schedules
  # GET /schedules.json
  def index
    @schedules = Schedule.all
    @course = Course.all
    @professor = Professor.all 
    @laboratory= Laboratory.all
    @day = Day.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @schedules }
    end
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
    @schedule = Schedule.find(params[:id])
    @course = Course.all
    @professor = Professor.all
    @laboratory= Laboratory.all
    @day = Day.all
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @schedule }
    end
  end

  # GET /schedules/new
  # GET /schedules/new.json
  def new
    @schedule = Schedule.new
    @course = Course.all
    @professor = Professor.all
    @laboratory= Laboratory.all
    @eap=Eap.all
    @day = Day.all
    @current_method = "new"
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :xml => @schedule }
    end
  end

  # GET /schedules/1/edit
  def edit
    @schedule = Schedule.find(params[:id])
    @course = Course.all
    @professor = Professor.all
    @day = Day.all
    @eap=Eap.all
    @laboratory= Laboratory.all
    @current_method = "update"
  end

  # POST /schedules
  # POST /schedules.json
  def create
    @schedule = Schedule.new(params[:schedule])
    @eap=Eap.all
    @profesor = Professor.find(params[:profesor][:id])
    @profesor.course_id = @schedule.course_id
    @profesor.save
    
    respond_to do |format|
      if @schedule.save
        format.html { redirect_to @schedule, notice: 'Schedule was successfully created.' }
        format.json { render :xml => @schedule, status: :created, location: @schedule }
      else
        format.html { render action: "new" }
        format.json { render :xml => @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /schedules/1
  # PUT /schedules/1.json
  def update
    @schedule = Schedule.find(params[:id])

    respond_to do |format|
      if @schedule.update_attributes(params[:schedule])
        format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy

    respond_to do |format|
      format.html { redirect_to schedules_url }
      format.json { head :no_content }
    end
  end

  #dynamic courses
  def dynamic_new
    @schedule = Schedule.new
    @course = Course.all
    @professor = Professor.all    
    @laboratory = Laboratory.all
    @laboratory1 = Laboratory.find(:all ,:joins => {:schedules  => {course: :professor}}, :select => "*,schedules.id as id, laboratories.id as lab_id,courses.name as title, professors.name as body, courses.group_id as group_id", :conditions => {:id => 1})
    @lab= @laboratory1.to_json(:only => [ :id, :day_id ,:start ,:end,:title, :body, :lastname, :group_id])
    @eap=Eap.all
    @day = Day.all
    @current_method = "new"
    respond_to do |format|
      format.html # dynamic_new.html.erb
      format.json { render :xml => @schedule }
    end
  end
end

class TodoListsController < ProjectController
  before_filter :find_project
  
  def find_project
    @project = Project.find(params[:project_id])
  end
  
  
  # GET /todo_lists
  # GET /todo_lists.xml
  def index
    @todo_lists = TodoList.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @todo_lists }
    end
  end

  # GET /todo_lists/1
  # GET /todo_lists/1.xml
  def show
    @todo_list = TodoList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @todo_list }
    end
  end

  # GET /todo_lists/new
  # GET /todo_lists/new.xml
  def new
    @todo_list = TodoList.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @todo_list }
    end
  end

  # GET /todo_lists/1/edit
  def edit
    @todo_list = TodoList.find(params[:id])
  end

  # POST /todo_lists
  # POST /todo_lists.xml
  def create
    @todo_list = @project.todo_lists.build(params[:todo_list])

    respond_to do |format|
      if @todo_list.save
        flash[:notice] = 'TodoList was successfully created.'
        format.html { redirect_to(@project) }
        format.xml  { render :xml => @todo_list, :status => :created, :location => @todo_list }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @todo_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /todo_lists/1
  # PUT /todo_lists/1.xml
  def update
    @todo_list = TodoList.find(params[:id])

    respond_to do |format|
      if @todo_list.update_attributes(params[:todo_list])
        flash[:notice] = 'TodoList was successfully updated.'
        format.html { redirect_to(@todo_list) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @todo_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /todo_lists/1
  # DELETE /todo_lists/1.xml
  def destroy
    @todo_list = TodoList.find(params[:id])
    @todo_list.destroy

    respond_to do |format|
      format.html { redirect_to(@project) }
      format.xml  { head :ok }
    end
  end
end

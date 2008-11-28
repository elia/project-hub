class TodoItemsController < TodoListsController
  
  before_filter :find_todo_list
  
  def find_todo_list
    @todo_list = @project.todo_lists.find(params[:todo_list_id])
  end
  
  # GET /todo_items
  # GET /todo_items.xml
  def index
    @todo_items = TodoItem.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @todo_items }
    end
  end

  # GET /todo_items/1
  # GET /todo_items/1.xml
  def show
    @todo_item = TodoItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @todo_item }
    end
  end

  # GET /todo_items/new
  # GET /todo_items/new.xml
  def new
    @todo_item = TodoItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @todo_item }
    end
  end

  # GET /todo_items/1/edit
  def edit
    @todo_item = TodoItem.find(params[:id])
  end

  # POST /todo_items
  # POST /todo_items.xml
  def create
    @todo_item = TodoItem.new(params[:todo_item].merge(:todo_list => @todo_list))

    respond_to do |format|
      if @todo_item.save
        flash[:notice] = 'Item was successfully created.'
        format.html { redirect_to(@project) }
        format.xml  { render :xml => @todo_item, :status => :created, :location => @todo_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @todo_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /todo_items/1
  # PUT /todo_items/1.xml
  def update
    @todo_item = TodoItem.find(params[:id])

    respond_to do |format|
      if @todo_item.update_attributes(params[:todo_item])
        flash[:notice] = 'Item was successfully updated.'
        format.html { redirect_to(@todo_item) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @todo_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /todo_items/1
  # DELETE /todo_items/1.xml
  def destroy
    @todo_item = TodoItem.find(params[:id])
    @todo_item.destroy

    respond_to do |format|
      format.html { redirect_to(@project) }
      format.xml  { head :ok }
    end
  end
end

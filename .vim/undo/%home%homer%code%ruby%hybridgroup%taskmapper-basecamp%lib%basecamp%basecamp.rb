Vim�UnDo� o��|e7G��Vp��F	5�_�����,mu-  �       self.format = :xml   �         	       	   	   	    P�i    _�                     �       ����                                                                                                                                                                                                                                                                                                                                                             P�nd     �   �   �  �      K    #self.format = ActiveResource::Formats::JSONFormat # for 6.1 capability5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             P�nf    �   �   �              self.format = :xml5�_�                   �       ����                                                                                                                                                                                                                                                                                                                                                             P�n�     �   �   �  �      J    self.format = ActiveResource::Formats::JSONFormat # for 6.1 capability5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             P�n�    �   �   �  �          self.format = 5�_�                    �        ����                                                                                                                                                                                                                                                                                                                                                             P��     �              �   require 'net/https'   require 'yaml'   require 'date'   require 'time'       begin     require 'xmlsimple'   rescue LoadError     begin       require 'rubygems'       require 'xmlsimple'     rescue LoadError       abort <<-ERROR   LThe 'xml-simple' library could not be loaded. If you have RubyGems installed   =you can install xml-simple by doing "gem install xml-simple".   ERROR     end   end       begin     require 'active_resource'   rescue LoadError     begin       require 'rubygems'       require 'active_resource'     rescue LoadError       abort <<-ERROR   HThe 'active_resource' library could not be loaded. If you have RubyGems    Oinstalled you can install ActiveResource by doing "gem install activeresource".   ERROR     end   end       B# = A Ruby library for working with the Basecamp web-services API.   #   B# For more information about the Basecamp web-services API, visit:   #   +#   http://developer.37signals.com/basecamp   #   H# NOTE: not all of Basecamp's web-services are accessible via REST. This   N# library provides access to RESTful services via ActiveResource. Services not   L# yet upgraded to REST are accessed via the Basecamp class. Continue reading   # for more details.   #   #   # == Establishing a Connection   #   L# The first thing you need to do is establish a connection to Basecamp. This   J# requires your Basecamp site address and your login credentials. Example:   #   N#   Basecamp.establish_connection!('you.grouphub.com', 'username', 'password')   #   O# This is the same whether you're accessing using the ActiveResource interface,   # or the legacy interface.   #   #   0# == Using the REST interface via ActiveResource   #   K# The REST interface is accessed via ActiveResource, a popular Ruby library   K# that implements object-relational mapping for REST web-services. For more   2# information on working with ActiveResource, see:   #   @#  * http://api.rubyonrails.org/files/activeresource/README.html   @#  * http://api.rubyonrails.org/classes/ActiveResource/Base.html   #   #   # === Finding a Resource   #   N# Find a specific resource using the +find+ method. Attributes of the resource   L# are available as instance methods on the resulting object. For example, to   K# find a message with the ID of 8675309 and access its title attribute, you   # would do the following:   #   '#   m = Basecamp::Message.find(8675309)   #   m.title # => 'Jenny'   #   G# To find all messages for a given project, use find(:all), passing the   -# project_id as a parameter to find. Example:   #   N#   messages = Basecamp::Message.find(:all, params => { :project_id => 1037 })   #   messages.size # => 25   #   #   # === Creating a Resource   #   J# Create a resource by making a new instance of that resource, setting its   J# attributes, and saving it. If the resource requires a prefix to identify   L# it (as is the case with resources that belong to a sub-resource, such as a   K# project), it should be specified when instantiating the object. Examples:   #   2#   m = Basecamp::Message.new(:project_id => 1037)   #   m.category_id = 7301   ##   m.title = 'Message in a bottle'   :#   m.body = 'Another lonely day, with no one here but me'   #   m.save # => true   #   0#   c = Basecamp::Comment.new(:post_id => 25874)   -#   c.body = 'Did you get those TPS reports?'   #   c.save # => true   #   M# You can also create a resource using the +create+ method, which will create   ## and save it in one step. Example:   #   J#   Basecamp::TodoItem.create(:todo_list_id => 3422, :contents => 'Do it')   #   #   # === Updating a Resource   #   K# To update a resource, first find it by its id, change its attributes, and   # save it. Example:   #   '#   m = Basecamp::Message.find(8675309)   #   m.body = 'Changed'   #   m.save # => true   #   #   # === Deleting a Resource   #   K# To delete a resource, use the +delete+ method with the ID of the resource   # you want to delete. Example:   #   "#   Basecamp::Message.delete(1037)   #   #   ## === Attaching Files to a Resource   #   N# If the resource accepts file attachments, the +attachments+ parameter should   7# be an array of Basecamp::Attachment objects. Example:   #   I#   a1 = Basecamp::Attachment.create('primary', File.read('primary.doc'))   I#   a2 = Basecamp::Attachment.create('another', File.read('another.doc'))   #   2#   m = Basecamp::Message.new(:project_id => 1037)   #   ...   #   m.attachments = [a1, a2]   #   m.save # => true   #   #   # = Using the non-REST inteface   #   I# The non-REST interface is accessed via instance methods on the Basecamp   K# class. Ensure you've established a connection, then create a new Basecamp   O# instance and call methods on it. Object attributes are accessible as methods.   
# Example:   #   #   session = Basecamp.new   ;#   person = session.person(93832) # => #<Record(person)..>   "#   person.first_name # => "Jason"   #   class BasecampAPI     class Connection #:nodoc:       def initialize(master)         @master = master   I      @connection = Net::HTTP.new(master.site, master.use_ssl ? 443 : 80)   *      @connection.use_ssl = master.use_ssl   K      @connection.verify_mode = OpenSSL::SSL::VERIFY_NONE if master.use_ssl       end       &    def post(path, body, headers = {})   W      request = Net::HTTP::Post.new(path, headers.merge('Accept' => 'application/xml'))   8      request.basic_auth(@master.user, @master.password)   (      @connection.request(request, body)       end     end       0  class Resource < ActiveResource::Base #:nodoc:       self.format = :json       class << self   $      def parent_resources(*parents)   #        @parent_resources = parents   	      end             def element_name   (        name.split(/::/).last.underscore   	      end             def prefix_source           if @parent_resources   g          @parent_resources.map { |resource| "/#{resource.to_s.pluralize}/:#{resource}_id" }.join + '/'           else             '/'           end   	      end             def prefix(options = {})           if options.any?   b          options.map { |name, value| "/#{name.to_s.chomp('_id').pluralize}/#{value}" }.join + '/'           else             '/'           end   	      end       end          V    # Commented because it was causing a Missing prefix error when updating a TodoItem       #def prefix_options       #  id ? {} : super       #end     end         class Account < Resource     end         class People < Resource     end         class Project < Resource     end         class Company < Resource       parent_resources :project       1    def self.on_project(project_id, options = {})   E      find(:all, :params => options.merge(:project_id => project_id))       end     end       -  # == Creating different types of categories     #   K  # The type parameter is required when creating a category. For exampe, to   ;  # create an attachment category for a particular project:     #   5  #   c = Basecamp::Category.new(:project_id => 1037)     #   c.type = 'attachment'     #   c.name = 'Pictures'     #   c.save # => true     #     class Category < Resource       parent_resources :project       *    def self.all(project_id, options = {})   E      find(:all, :params => options.merge(:project_id => project_id))       end       6    def self.post_categories(project_id, options = {})   V      find(:all, :params => options.merge(:project_id => project_id, :type => 'post'))       end       <    def self.attachment_categories(project_id, options = {})   \      find(:all, :params => options.merge(:project_id => project_id, :type => 'attachment'))       end     end         class Message < Resource       parent_resources :project       set_element_name 'post'       M    # Returns the most recent 25 messages in the given project (and category,   L    # if specified). If you need to retrieve older messages, use the archive       # method instead. Example:       #   &    #   Basecamp::Message.recent(1037)   <    #   Basecamp::Message.recent(1037, :category_id => 7301)       #   -    def self.recent(project_id, options = {})   E      find(:all, :params => options.merge(:project_id => project_id))       end       N    # Returns a summary of all messages in the given project (and category, if   N    # specified). The summary is simply the title and category of the message,   =    # as well as the number of attachments (if any). Example:       #   '    #   Basecamp::Message.archive(1037)   =    #   Basecamp::Message.archive(1037, :category_id => 7301)       #   .    def self.archive(project_id, options = {})   X      find(:all, :params => options.merge(:project_id => project_id), :from => :archive)       end           def comments(options = {})   P      @comments ||= Comment.find(:all, :params => options.merge(:post_id => id))       end     end       /  # == Creating comments for multiple resources     #   L  # Comments can be created for messages, milestones, and to-dos, identified   M  # by the <tt>post_id</tt>, <tt>milestone_id</tt>, and <tt>todo_item_id</tt>     # params respectively.     #   E  # For example, to create a comment on the message with id #8675309:     #   4  #   c = Basecamp::Comment.new(:post_id => 8675309)     #   c.body = 'Great tune'     #   c.save # => true     #   2  # Similarly, to create a comment on a milestone:     #   9  #   c = Basecamp::Comment.new(:milestone_id => 8473647)   "  #   c.body = 'Is this done yet?'     #   c.save # => true     #     class Comment < Resource       parent_resources :todo_item     end         class TodoList < Resource       parent_resources :project       P    # Returns all lists for a project. If complete is true, only completed lists   N    # are returned. If complete is false, only uncompleted lists are returned.   ,    def self.all(project_id, complete = nil)         filter = case complete   $               when nil   then "all"   )               when true  then "finished"   (               when false then "pending"   G               else raise ArgumentError, "invalid value for `complete'"                  end       M      find(:all, :params => { :project_id => project_id, :filter => filter })       end            def todo_items(options = {})   X      @todo_items ||= TodoItem.find(:all, :params => options.merge(:todo_list_id => id))       end     end        K  # This resource is to address GET /todo_lists.xml?responsible_party=#{id}   ;  # To retrieve Todo lists with items inside in one request   $  class TodoListWithItems < Resource       def self.element_name         "todo_lists"       end     end         class TodoItem < Resource       parent_resources :todo_list           def todo_list(options = {})   9      @todo_list ||= TodoList.find(todo_list_id, options)       end       "    def time_entries(options = {})   [      @time_entries ||= TimeEntry.find(:all, :params => options.merge(:todo_item_id => id))       end           def comments(options = {})   U      @comments ||= Comment.find(:all, :params => options.merge(:todo_item_id => id))       end           def complete!         put(:complete)       end           def uncomplete!         put(:uncomplete)       end     end         class TimeEntry < Resource   )    parent_resources :project, :todo_item       &    def self.all(project_id, page = 0)   I      find(:all, :params => { :project_id => project_id, :page => page })       end           def self.report(options={})   6      find(:all, :from => :report, :params => options)       end     end         class Category < Resource       parent_resources :project     end         class Attachment   *    attr_accessor :id, :filename, :content       &    def self.create(filename, content)   6      returning new(filename, content) do |attachment|           attachment.save   	      end       end       %    def initialize(filename, content)   -      @filename, @content = filename, content       end           def attributes   5      { :file => id, :original_filename => filename }       end           def to_xml(options = {})   -      { :file => attributes }.to_xml(options)       end           def inspect   
      to_s       end           def save   k      response = Basecamp.connection.post('/upload', content, 'Content-Type' => 'application/octet-stream')             if response.code == '200'   >        self.id = Hash.from_xml(response.body)['upload']['id']           true   
      else   Q        raise "Could not save attachment: #{response.message} (#{response.code})"   	      end       end     end         class Record #:nodoc:       attr_reader :type           def initialize(type, hash)         @type, @hash = type, hash       end           def [](name)         name = dashify(name)             case @hash[name]         when Hash then    `        @hash[name] = if (@hash[name].keys.length == 1 && @hash[name].values.first.is_a?(Array))   b                        @hash[name].values.first.map { |v| Record.new(@hash[name].keys.first, v) }                         else   5                        Record.new(name, @hash[name])                         end   
      else           @hash[name]   	      end       end       
    def id         @hash['id']       end           def attributes         @hash.keys       end           def respond_to?(sym)   +      super || @hash.has_key?(dashify(sym))       end       "    def method_missing(sym, *args)   9      if args.empty? && !block_given? && respond_to?(sym)           self[sym]   
      else           super   	      end       end           def to_s   4      "\#<Record(#{@type}) #{@hash.inspect[1..-2]}>"       end           def inspect   
      to_s       end           private           def dashify(name)         name.to_s.tr("_", "-")       end     end         attr_accessor :use_xml         class << self   1    attr_reader :site, :user, :password, :use_ssl       D    def establish_connection!(site, user, password, use_ssl = false)         @site     = site         @user     = user         @password = password         @use_ssl  = use_ssl             Resource.user = user   "      Resource.password = password   A      Resource.site = (use_ssl ? "https" : "http") + "://" + site       (      @connection = Connection.new(self)       end           def connection   7      @connection || raise('No connection established')       end     end         def initialize       @use_xml = false     end       N  # ==========================================================================   
  # PEOPLE   N  # ==========================================================================       L  # Return an array of the people in the given company. If the project-id is   M  # given, only people who have access to the given project will be returned.   (  def people(company_id, project_id=nil)   5    url = project_id ? "/projects/#{project_id}" : ""   +    url << "/contacts/people/#{company_id}"       records "person", url     end       9  # Return information about the person with the given id     def person(id)   #    record "/contacts/person/#{id}"     end       N  # ==========================================================================     # MILESTONES   N  # ==========================================================================       O  # Returns a list of all milestones for the given project, optionally filtered   5  # by whether they are completed, late, or upcoming.   *  def milestones(project_id, find = 'all')   Q    records "milestone", "/projects/#{project_id}/milestones/list", :find => find     end       L  # Create a new milestone for the given project. +data+ must be hash of the   J  # values to set, including +title+, +deadline+, +responsible_party+, and     # +notify+.   (  def create_milestone(project_id, data)   /    create_milestones(project_id, [data]).first     end       H  # As #create_milestone, but can create multiple milestones in a single   O  # request. The +milestones+ parameter must be an array of milestone values as   #  # described in #create_milestone.   /  def create_milestones(project_id, milestones)   ^    records "milestone", "/projects/#{project_id}/milestones/create", :milestone => milestones     end       "  # Updates an existing milestone.   I  def update_milestone(id, data, move = false, move_off_weekends = false)   :    record "/milestones/update/#{id}", :milestone => data,   &    :move_upcoming_milestones => move,   A      :move_upcoming_milestones_off_weekends => move_off_weekends     end       -  # Destroys the milestone with the given id.     def delete_milestone(id)   %    record "/milestones/delete/#{id}"     end       ,  # Complete the milestone with the given id     def complete_milestone(id)   '    record "/milestones/complete/#{id}"     end       .  # Uncomplete the milestone with the given id     def uncomplete_milestone(id)   )    record "/milestones/uncomplete/#{id}"     end       	  private       J  # Make a raw web-service request to Basecamp. This will return a Hash of   I  # Arrays of the response, and may seem a little odd to the uninitiated.   $  def request(path, parameters = {})   g    response = Basecamp.connection.post(path, convert_body(parameters), "Content-Type" => content_type)       $    if response.code.to_i / 100 == 2   y      result = XmlSimple.xml_in(response.body, 'keeproot' => true, 'contentkey' => '__content__', 'forcecontent' => true)         typecast_value(result)       else   4      raise "#{response.message} (#{response.code})"       end     end       G  # A convenience method for wrapping the result of a query in a Record   J  # object. This assumes that the result is a singleton, not a collection.   !  def record(path, parameters={})   &    result = request(path, parameters)   Y    (result && !result.empty?) ? Record.new(result.keys.first, result.values.first) : nil     end       E  # A convenience method for wrapping the result of a query in Record   H  # objects. This assumes that the result is a collection--any singleton   '  # result will be wrapped in an array.   (  def records(node, path, parameters={})   @    result = request(path, parameters).values.first or return []   &    result = result[node] or return []   -    result = [result] unless Array === result   .    result.map { |row| Record.new(node, row) }     end         def convert_body(body)   6    body = use_xml ? body.to_legacy_xml : body.to_yaml     end         def content_type   6    use_xml ? "application/xml" : "application/x-yaml"     end         def typecast_value(value)       case value       when Hash   &      if value.has_key?("__content__")   @        content = translate_entities(value["__content__"]).strip           case value["type"]   )        when "integer"  then content.to_i   .        when "boolean"  then content == "true"   0        when "datetime" then Time.parse(content)   0        when "date"     then Date.parse(content)   $        else                 content           end   R        # a special case to work-around a bug in XmlSimple. When you have an empty   O        # tag that has an attribute, XmlSimple will not add the __content__ key   M        # to the returned hash. Thus, we check for the presense of the 'type'   L        # attribute to look for empty, typed tags, and simply return nil for           # their value.   "      elsif value.keys == %w(type)           nil   "      elsif value["nil"] == "true"           nil   N        # another special case, introduced by the latest rails, where an array   O        # type now exists. This is parsed by XmlSimple as a two-key hash, where   D        # one key is 'type' and the other is the actual array value.   >      elsif value.keys.length == 2 && value["type"] == "array"           value.delete("type")           typecast_value(value)   
      else   :        value.empty? ? nil : value.inject({}) do |h,(k,v)|   "          h[k] = typecast_value(v)   	        h           end   	      end       when Array   *      value.map! { |i| typecast_value(i) }         case value.length         when 0 then nil         when 1 then value.first         else value   	      end       else   -      raise "can't typecast #{value.inspect}"       end     end         def translate_entities(value)       value.gsub(/&lt;/, "<").         gsub(/&gt;/, ">").         gsub(/&quot;/, '"').         gsub(/&apos;/, "'").         gsub(/&amp;/, "&")     end   end       B# A minor hack to let Xml-Simple serialize symbolic keys in hashes   class Symbol     def [](*args)       to_s[*args]     end   end       
class Hash     def to_legacy_xml   O    XmlSimple.xml_out({:request => self}, 'keeproot' => true, 'noattr' => true)     end   end5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             P�g     �   �   �          K    #self.format = ActiveResource::Formats::JSONFormat # for 6.1 capability5�_�      	              �       ����                                                                                                                                                                                                                                                                                                                                                             P�h     �   �   �  �          self.format = :xml5�_�                  	   �       ����                                                                                                                                                                                                                                                                                                                                                             P�h    �   �   �  �          self.format = :5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             P�no     �   �   �  �          c;lass << self5��
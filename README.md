# Elastico

Elastico is a __simple__ layer that enables you to use elasticsearch __full__ API. The elasticsearch team created this [great API](http://www.elasticsearch.org/guide/) which enables you to do almost anything todays search engines allow you to do. 

__Simple__. Elastico is built in a way so your configuration and usage is as simple and straightforward as possible. 

__Full__. Elastico is built to be transparent, non-blocking, non-opinionated layer between your code to elasticsearch API. Meaning Elastico won't force anything about how to index your active records models, neither how to search it.

There is one reason for building it Simple and Full:
Elasticsearch community is large. Its supportive, and very helpful. Though most of it does not use ruby. Its most likely that you want to spend your time on feaguring out how to use elasticsearch rather than how to use the gem that works with elasticsearch. If you use Elastico, its most likely that your time will go to the former, and will be able to take advantage of the elasticsearch community.

You should give Elastico a try if you want to use elasticsearch full api. 


## Elasticsearch mini Background

In general, in order to be able to use elasticsearch search capabilities you should:

1. Define what and how you want to index (settings and mappings)
2. Define what and how you want to search (query the index)

## Installation

Install elasticsearch:

    cd ~
    wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.5.tar.gz .
    tar -zxvf elasticsearch-0.90.5.tar.gz /bin/
    rm elasticsearch-0.90.5.tar.gz

Now run it:

    /bin/elasticsearch-0.90.5/bin/elasticsearch -f

Add this line to your application's Gemfile:

    gem 'elastico'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install elastico

## Usage

In your model:

    class Apple < ActiveRecord::Base

      attr_accessible :color, :name
      
      def self.prepare_elastico_settings_and_mappings_json
        json = { "settings" => 
                  {
                    "number_of_shards" => 3
                  },
                  "mappings" =>
                  {
                      "apple" => 
                      {
                        "properties" => 
                        {
                          "name" => {"type" => "string"},
                          "color" => {"type" => "string"}
                        }
                      }
                  }
                }.to_json
      end

      # include elastico only after you declared your settings and mappings json in the method prepare_elastico_settings_and_mappings_json
      include Elastico
    end


In your controller:

    class ApplesController < ApplicationController  
        def index
          if params[:query]
            Apple.search_query = prepare_search_json_for params[:query]
            @apples = Apple.elastico_search
          else
            @apples = Apple.all
          end
        end

        private
          def prepare_search_json_for query
            json = { "query" => 
                      {
                        "term" => { "color" => query.to_s }
                      }
                    }.to_json
          end
        # now do something with your apples 
    end

Import your active record instances simply by:

    Apple.elastico_import_all

Learn by Example
================
Fork/Clone the example app that shows how to use Elastico [here](https://github.com/gneyal/ElasticoExample).


Configure it
------------

In order to get a model work with elasticsearch + Elastico you have to:

__Mandatory__

1. In your controller, Create a class method __'prepare\_search\_json\_for'__ to be your standard search query for that model (defaults to nil). This is the same search query you would send if you were using the curl command.

2. In your model, Create a class method __'prepare\_elastico\_settings\_and\_mappings\_json'__ to be your settings and mapping json (defaults to nil). This is the same search query you would send if you were using the curl command.

__Optional__

1. Set Apple.elastico\_url= to be the ip of your elasticsearch server (defaults to "localhost:9200").

2. Set up Apple.elastico\_index\_name (optional - defaults to your class name followed by Rail.env; here it will be apples_development).

3. Set up Apple.elastico\_type\_name (optional - defaults to your class name; here it will be Apple).

4. Run Apple.elastico_import_all to import all your data.

Use it.
-------
1. After every save Elastico will automatically save your instance in elasticsearch.

2. Import current database by Apple.elastico_import_all.

3. Search it: call Apple.elastico_search to get your results, or override it to better suit your needs.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Feedback

Please send your feedback to gneyal+elastico@gmail.com
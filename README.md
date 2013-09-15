# Elastico

Elastico is a simple way to use elasticsearch. 

You should use Elastico if you want to use elasticsearch full api. 

## Installation

Add this line to your application's Gemfile:

    gem 'elastico'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install elastico

## Usage

    class ElasticoEnabledClass 
        include Elastico 
    end 

In order to get a model work with elasticsearch + Elastico you have to:

Configure it:
-------------
1. Set ElasticoEnabledClass.elastico_url= to be the ip of your elasticsearch server (defaults to "localhost").

2. Set ElasticoEnabledClass.settings_and_mappings_json= to be your settings and mapping json (defaults to nil, meaning you HAVE to set this up).

3. Set up ElasticoEnabledClass.elastico_index_name (optional - defaults to your class name followed by Rail.env; here it will be elasticoenabledclass_development).

4. Set up ElasticoEnabledClass.elastico_type_name (optional - defaults to your class name; here it will be elasticoenabledclass).

5. Set up ElasticoEnabledClass.search_json= to be your standard search query for that model (required - defaults to nil, meaning you HAVE to set this up).

Use it.
-------
1. After every save Elastico will automatically save you instance in elasticsearch.

2. Import current database instances by creating a rake task to "save" them all.

3. Search it: call ElasticoEnabledClass.elastico_search to get your results, or override it to better suit your needs.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

<!-- Setup
=====
You should give a hash that looks something like that:
  
    settings_json[:settings] = {
                    :settings => {
                      :number_of_shards => 2,
                      :number_of_replicas => 0,
                      :analysis => {
                        :filter => {
                          :my_ngram  => {
                             "type"     => "nGram",
                             "max_gram" => 15,
                             "min_gram" => 1 
                           },
                           :my_stemmer => {
                            "type" => "stemmer",
                            "name" => "english"
                            }
                         },
                          :analyzer => {
                            :ngram_analyzer => {
                              "tokenizer"    => "whitespace",
                              "filter"       => ["stop", "my_ngram", "lowercase"],
                              "type"         => "custom" 
                            }
                          }
                       } 
                      }
                    } -->

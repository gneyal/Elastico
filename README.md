# Elastico

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'elastico'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install elastico

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Usage:

In order to get a model work with elastic search you have to:
1. Set Elastico::Configuration.url= to be the ip of your elasticsearch server (defaults to "localhost").
2. Set Elastico::Index.settings_and_mappings_json= to be your settings and mapping json.
3. Set up Elastico::Search.search_json= to be your standard search query for that model.
4. Elastico will automatically save your active record models after every "save" call on that instance.
5. In later versions I will add an auto rake task to import all of your Elastico models to elasticsearch server.


In order to search this model, all you need to do is to do Model.elastic_search(term). This will return the elasticsearch results in an Elastico results object. You should override this method (elastic_search) if you want to get a better tailored solution.
=======

Usage:
======

1. Setup (define the mapping and settings)
2. Index current data (Rake task)
3. Search (define how to search, what to search)
4. Callbacks (automatically added)


class Someclass < ActiveRecord::Base
	Elastico::Setup = { } (How to index)
	Elastico::Search = {} (What to search)
	Elastico:Index = {} (What to index)
end


Setup
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
              }

a

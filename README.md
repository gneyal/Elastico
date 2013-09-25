# Elastico

Elastico is a __simple__ layer that enables you to use elasticsearch __full__ API. The elasticsearch team created this [great API](http://www.elasticsearch.org/guide/) which enables you to do almost anything todays search engines allow you to do. 

__Simple__. Elastico is built in a way so your configuration and usage is as simple and streat forward as possible. 

__Full__. Elastico is built to be transparent, non-blocking, non-opinionated layer between your code to elasticsearch API. Meaning Elastico won't force anything about how to index your active records models, neither how to search it.

There is one reason for building it Simple and Full:
Elasticsearch community is large. Its supportive, and very helpful. Though most of it does not use ruby. Its most likely that you want to spend your time on feaguring out how to use elasticsearch rather than how to use the gem that works with elasticsearch. If you use Elastico, its most likely that your time will go to the former, and will be able to take advantage of the elasticsearch community.

You should give Elastico a try if you want to use elasticsearch full api. 


## Elasticsearch mini Background

In general, in order to be able to use elasticsearch search capabilities you should:

1. Define what and how you want to index (settings and mappings)
2. Define what and how you want to search (query the index)

## Installation

Add this line to your application's Gemfile:

    gem 'elastico'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install elastico

## Usage

In your model:

    class ElasticoEnabledClass < ActiveRecord::Base
        include Elastico

        settings_and_mappings_json = YOUR_JSON_COMES_HERE
        search_json = YOUR_JSON_COMES_HERE
    end

In your controller:

    class ElasticosController < ApplicationController  
        results = ElasticoEnabledClass.elastico_search

        # now do something with the results 
    end

In order to get a model work with elasticsearch + Elastico you have to:

Configure it
------------
__Mandatory__

1. Set up ElasticoEnabledClass.search\_json= to be your standard search query for that model (defaults to nil). This is the same search query you would send if you were using the curl command.

2. Set ElasticoEnabledClass.settings\_and\_mappings\_json= to be your settings and mapping json (defaults to nil). This is the same search query you would send if you were using the curl command.

__Optional__

1. Set ElasticoEnabledClass.elastico\_url= to be the ip of your elasticsearch server (defaults to "localhost:9200").

2. Set up ElasticoEnabledClass.elastico\_index\_name (optional - defaults to your class name followed by Rail.env; here it will be elasticoenabledclass_development).

3. Set up ElasticoEnabledClass.elastico\_type\_name (optional - defaults to your class name; here it will be elasticoenabledclass).

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

## Feedback

Please send your feedback to gneyal+elastico@gmail.com
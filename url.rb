#!/usr/bin/env ruby

require "base64"
require "cgi"
require "openssl"

AWS_ID = "replace_with_aws_id"
AWS_KEY = "replace_with_aws_key"
EXPIRATION = 10 * 60

bucket_name = ARGV[0]
file_path = ARGV[1]

expires = Time.now.utc.to_i + EXPIRATION

string_to_sign = "GET\n\n\n#{expires}\n/#{bucket_name}/#{file_path}"

hmac = OpenSSL::HMAC.digest("sha1", AWS_KEY, string_to_sign)
signature = Base64.encode64(hmac).chomp

#puts string_to_sign
puts "https://#{bucket_name}.s3.amazonaws.com/#{file_path}?AWSAccessKeyId=#{AWS_ID}&Expires=#{expires}&Signature=#{CGI.escape(signature)}"

# encoding: utf-8
require 'spec_helper'

describe MeCab::Mora do
  subject { MeCab::Mora }
  context "#count" do
    it "めかぶ == 3" do
      subject.new("めかぶ").count.should == 3
    end

    it "今日は雨 == 5" do
      subject.new("今日は雨").count.should == 5
    end
  end
end

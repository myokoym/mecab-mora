# encoding: utf-8

require 'MeCab'
require 'mecab-modern'

module MeCab
  class Node
    def kana
      feature.split(/,/)[8]
    end
  end

  class Mora
    def initialize(text)
      @moras = split(text)
    end

    def count
      @moras.flatten.size
    end

    private
    def split(text)
      nodes = MeCab::Tagger.new.parseToNode(text)
      moras = []
      nodes.each do |node|
        surface = node.surface
        next if surface.empty?
        kana = node.kana
        if kana
          moras << select_mora(kana)
        else
          moras << select_mora(surface)
        end
      end
      moras
    end

    def select_mora(kana)
      hiragana_to_katakana(kana).gsub(/[^アイウエオカ-モヤユヨラ-ロワヲンヴー]/, "").split(//)
    end
  
    def hiragana_to_katakana(hiragana)
      hiragana.tr("ぁ-ゔ","ァ-ヴ")
    end
  end
end

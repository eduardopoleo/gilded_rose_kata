def update_quality(items)
  items.each do |item|
    if item.name != 'Sulfuras, Hand of Ragnaros'
      item.sell_in -= 1
    end

    case item.name
    when 'NORMAL ITEM'
      update_nomal_item_quality(item)
    when 'Aged Brie'
      update_aged_brie_quality(item)
    when 'Backstage passes to a TAFKAL80ETC concert'
      update_backtage_passess_quality(item)
    when 'Conjured Mana Cake'
      update_conjured_item_quality(item)
    else
      item.quality
    end
  end
end


def update_nomal_item_quality(item)
  if item.quality > 0
    item.sell_in < 0 ? item.quality -= 2 : item.quality -= 1
  end
end

def update_aged_brie_quality(item)
  if item.quality < 50
    item.quality += 1
    if item.sell_in < 0 && item.quality < 50
      item.quality += 1
    end
  end
end

def update_backtage_passess_quality(item)
  if item.quality < 50
    if item.sell_in < 0
      item.quality = 0
    else
      item.quality += 1

      if item.sell_in < 10 && item.quality < 50
        item.quality += 1
      end

      if item.sell_in < 5 && item.quality < 50
        item.quality += 1
      end
    end
  end
end

def update_conjured_item_quality(item)
  if item.quality > 0
    item.sell_in <= 0 ? item.quality -= 4 : item.quality -= 2
  end
end


Item = Struct.new(:name, :sell_in, :quality)

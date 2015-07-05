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
  decrease_item_quality(1, item) 
end

def update_aged_brie_quality(item)
  if has_not_reached_max_quality(item)
    increase_item_quality(item)
    increase_item_quality(0, item)
  end
end

def update_backtage_passess_quality(item)
  if has_not_reached_max_quality(item)
    if item.sell_in < 0
      item.quality = 0
    else
      increase_item_quality(item)
      increase_item_quality(10, item)
      increase_item_quality(5, item)
    end
  end
end

def update_conjured_item_quality(item)
  decrease_item_quality(2,item)
end
######Extra Helper methods##############
def decrease_item_quality(devaluation_factor, item)
  if item.quality > 0
    item.sell_in <= 0 ? item.quality -= 2*devaluation_factor : item.quality -= devaluation_factor
  end
end

def increase_item_quality(sell_in_limit=nil, item)
  if !sell_in_limit
    item.quality += 1
  elsif item.sell_in < sell_in_limit && has_not_reached_max_quality(item)
    item.quality += 1
  end
end

def has_not_reached_max_quality(item)
  item.quality < 50
end


Item = Struct.new(:name, :sell_in, :quality)

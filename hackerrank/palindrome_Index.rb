require 'byebug'

def palindromeIndex1(str)
  return -1 if str == str.reverse

  for i in 0..str.length - 1 do
    new_str = str.dup
    new_str.slice!(i)
    return i if new_str.reverse == new_str
  end

  return -1
end

# optimised - matching index values from start and end
def palindromeIndex(str)
  return -1 if str == str.reverse

  last_index = str.length - 1
  chars = str.split('')

  for i in 0..last_index do
    if chars[i] != chars[last_index - i]
      middle_string1 = chars[(i + 1)..(last_index - i)].join
      middle_string2 = chars[i..(last_index - i - 1)].join

      return (i) if (middle_string1 == middle_string1.reverse)
      return (last_index - i) if (middle_string2 == middle_string2.reverse)
      return -1
    end
  end
end

puts palindromeIndex 'aaab'
puts palindromeIndex 'baa'
puts palindromeIndex 'aaa'
puts palindromeIndex 'hgygsvlfcwnswtuhmyaljkqlqjjqlqkjlaymhutwsnwcwflvsgygh'
puts palindromeIndex 'aprrmdeykhorwsalkysinbvylgcgiaokrifgolfytvsqqufctxkjbijnonvapmkivrokewlasfskcxowyyiakrpyilyxbmgygxjkuwmpegcheqgdsogdjverkgpnuymbyxovublchqjojptegahpyojlucypdnqclfxijlkqevhoncsuedmftwsoytgchygsheeqrojwlrnbvivanjihibvjvelderylxderrnqffehdnfebqmlypjilovrspqgpvkipabvigflvkryegkdwuoklmcedumuqyfhyhfjpkvnwnmbuahtwxeikjopednxcsfdcmnrwlfvbuaxwhrthyeriskovxoasvdvisnhgveisggppblwapqkkbbiyqismnqvhgdnejxwrfohgaeirvuewvmyoutcjkassfixphuhmmruovfhtaltxysnvophbpatwjrmspwhcqcqmjahjobhpvulmmtnevjchcqarphvglmvwpfgeiqtenfsdbghxplhtdknstjciyxfofmsnfmtutmxvugvmrfhwpwsmjuukuabaovpvijrevpcqxadqgmpxmikvfhgcijcyfrvpdntydyrcyxuhmkiyvuwbdfenoimtdkjgxgiefaigxdonpwmltmpwrvkheadhkpqlvypbyxhadxnswchroyojucsyevjonaajyrmarwcuwpquuamlyduvhpulogdcidojxbmpaonxhescehpfknbudxgthjwpplcnoofpdsnmyiofphkcunwaoguvptnhfpwtgdlmxyyxjqdyxqeuedwujrqalhjswhpgmbskdrimiooifsdlvdhiuakjhtehbtnnxgbbajpjagtfyatxdbiabsjlmosqkggiohjotcatiuckuvkaysaclknabgqloxudfgsbisvtpxemtomuhnwualubtmojmjmtqhvbbruqrygnpsiwghriupjpcyboknkdvgfyacrrexhtrptaxnjudukhvlxhcjkapryswqkbrs{-truncated-}'

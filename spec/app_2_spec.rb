# Informations de configuration
require_relative '../app_2'

describe 'who is the biggest number' do
  # Hint: 'def who_is_bigger(a, b, c)'
  it 'tells me the biggest' do
    expect(who_is_bigger(84, 42, nil)).to eq("nil detected")
    expect(who_is_bigger(nil, 42, 21)).to eq("nil detected")
    expect(who_is_bigger(84, 42, 21)).to eq("a is bigger")
    expect(who_is_bigger(42, 84, 21)).to eq("b is bigger")
    expect(who_is_bigger(42, 21, 84)).to eq("c is bigger")
  end
end

describe 'crazy stuff on strings' do
  # Reverse, upcase then removes all L, T and A.
  # Hint: google ruby string
  it 'does crazy stuff on strings' do
    expect(reverse_upcase_noLTA("Tries this at Home, Kids"))
      .to eq("SDIK ,EMOH  SIH SEIR")
    expect(reverse_upcase_noLTA("Ponies loves carrots"))
      .to eq("SORRC SEVO SEINOP")
    expect(reverse_upcase_noLTA("qwertyuiopasdfghjkl;zxcvbn"))
      .to eq("NBVCXZ;KJHGFDSPOIUYREWQ")
  end
end
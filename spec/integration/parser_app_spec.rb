# frozen_string_literal: true

RSpec.describe 'Parse Log CLI App' do
  let(:cli) { App.new(filepath) }

  context 'when webserver.log file present' do
    let(:filepath) { 'spec/fixtures/files/webserver.log' }
    it { expect { cli.run }.to output(/contact 90 unique views/).to_stdout }
  end

  context 'when filepath argument is empty' do
    let(:filepath) { nil }
    it { expect { cli.run }.to output(/File filepath couldnt be blank/).to_stdout }
  end

  context 'when filepath argument is wrong' do
    let(:filepath) { 'wrong/path/file.log' }
    it { expect { cli.run }.to output(/No such file or directory/).to_stdout }
  end

  context 'when wrong file format provided' do
    let(:filepath) { 'wrong/path/file.mp4' }
    it { expect { cli.run }.to output(/Wrong file format/).to_stdout }
  end

  context 'when empty log file provided' do
    let(:filepath) { 'spec/fixtures/files/empty.log' }
    it { expect { cli.run }.to output(/No log entities found/).to_stdout }
  end
end

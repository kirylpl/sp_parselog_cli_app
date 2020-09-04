# frozen_string_literal: true

RSpec.describe 'Parse Log CLI App' do
  let(:filepath) { 'spec/fixtures/files/webserver.log' }
  let(:cli) { App.new(filepath) }

  context 'when webserver.log file present' do
    it { expect { cli.to output(/contact 90 unique views/).to_stdout } }
  end

  context 'when filepath argument is empty' do
    let(:filepath) { nil }
    it { expect { cli.to raise_error(ArgumentError, /File path couldnt be blank/) } }
  end

  context 'when filepath argument is wrong' do
    let(:filepath) { 'wrong/path/file.log' }
    it { expect { cli.to raise_error(Errno::ENOENT, /No such file or directory/) } }
  end

  context 'when wrong file format provided' do
    let(:filepath) { 'wrong/path/file.mp4' }
    it { expect { cli.to raise_error(RuntimeError, /Wrong file format/) } }
  end

  context 'when empty log file provided' do
    let(:filepath) { 'spec/fixtures/files/empty.log' }
    it { expect { cli.to raise_error(RuntimeError, /No log entities found/) }}
  end
end

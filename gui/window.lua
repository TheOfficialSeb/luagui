local common = require 'gui.common'
local Button = require 'gui.button'
local MenuBar = require 'gui.menu_bar'
local TextBox = require 'gui.text_box'
local FileDialog = require 'gui.file_dialog'

local Window = {}
local metatable = common.create_metatable(Window)
common.add_position(metatable, 'window')
common.add_client_size(metatable, 'window')
common.add_label(metatable, 'window', 'title')

function Window.create()
  local window = {}
  
  window.wx = wx.wxFrame(
    wx.NULL,
    wx.wxID_ANY,
    '',
    wx.wxDefaultPosition,
    wx.wxSize(640, 480),
    wx.wxDEFAULT_FRAME_STYLE)
  
  window.wx_panel = wx.wxPanel(
    window.wx,
    wx.wxID_ANY,
    wx.wxDefaultPosition,
    wx.wxDefaultSize)
  
  window.menu_bar = MenuBar.create()
  window.wx:SetMenuBar(window.menu_bar.wx)
  
  window.wx:Show(true)
  
  setmetatable(window, metatable)
  return window
end

function Window:create_file_dialog()
  return FileDialog.create(self)
end

function Window:add_button()
  return Button.create(self)
end

function Window:add_text_box()
  return TextBox.create(self)
end

function Window:close()
  self.wx:Close()
end

return Window
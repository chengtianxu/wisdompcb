unit dataimport_show;

interface

uses
  Classes,SysUtils,StrUtils;

type
  dataimport_showbar = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation

uses MainU, modify_card, UDM;

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure dataimport_showbar.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ dataimport_showbar }
                                                                         
procedure dataimport_showbar.Execute;
var
i,j:Integer;
time_1: TDateTime;
begin
time_1:=now;
while (mainu.Main_Form.button_dr.Enabled=false) do
begin

for i:=0 to 100 do
begin
mainu.Main_Form.StaticText_procbar.Caption:='正在进行工卡匹配，请勿退出！'+midstr(datetimetostr(now-time_1),12,8);
mainu.Main_Form.ProgressBar_importdata.Position:=i;
Sleep(10);
end;
mainu.Main_Form.StaticText_procbar.Caption:='卡匹配已完成';
mainu.Main_Form.Button_resetdr.Enabled:=true;
end;
//do while mainu.Main_Form.button_dr.Enabled=false
//
end;

end.

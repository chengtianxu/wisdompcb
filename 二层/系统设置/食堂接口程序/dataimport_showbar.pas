unit dataimport_showbar;

interface

uses
  Classes;

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
begin

while (mainu.Main_Form.button_dr.Enabled=false) do
begin

for i:=0 to 100 do
begin
mainu.Main_Form.ProgressBar_importdata.Position:=i;
sleep(100);
end;

end;
//do while mainu.Main_Form.button_dr.Enabled=false
//
end;

end.

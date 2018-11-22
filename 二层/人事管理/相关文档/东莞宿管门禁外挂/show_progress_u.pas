unit show_progress_u;

interface

uses
  Classes,SysUtils,StrUtils; 
type
  show_progress = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation

uses main_u;

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure show_progress.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ show_progress }

procedure show_progress.Execute;
var i,j:Integer;
time_1: TDateTime;
begin
  j:=0;
  time_1:=now;
   frm_main.txt1.Caption := '¸üÐÂÖÐ';
  while (frm_main.sql_flag = 0 ) do
  begin
  for i:=0 to 100 do
  begin
    frm_main.pb1.Position:=i;
    //
    Sleep(1);
    //j:=j+1;
    //if j>10000 then  frm_main.sql_flag := 1;
  end;
  end;
  frm_main.pb1.Position:=100;
end;

end.

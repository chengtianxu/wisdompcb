unit doorlist_u;

interface

uses
  Classes;

type
  doorlist = class(TThread)
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

    procedure doorlist.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ doorlist }

procedure doorlist.Execute;
begin
 frm_main.txt1.Caption := ''; 
 frm_main.qry1.ExecSQL ; 
 frm_main.sql_flag := 1;
 frm_main.txt1.Caption := '更新完成';
end;

end.

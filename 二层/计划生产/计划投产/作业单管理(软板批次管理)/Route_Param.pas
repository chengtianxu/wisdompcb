unit Route_Param;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ComCtrls, Buttons, Mask, Grids, Db, DBTables, Menus,
  ADODB, DBGrids;

type
  TFrmRoutParam = class(TForm)
    Label5: TLabel;
    UpDown1: TUpDown;
    Label13: TLabel;
    PopupMenu1: TPopupMenu;
    Add1: TMenuItem;
    Delete1: TMenuItem;
    Label12: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBGrid1: TDBGrid;
    Edit2: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1Enter(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure InitForm(rkey38:integer;str_Inst:string);
  end;

var
  FrmRoutParam: TFrmRoutParam;

implementation
uses dm;
{$R *.DFM}


procedure TFrmRoutParam.FormActivate(Sender: TObject);
begin
  Label12.Caption:=inttostr(dmcon.adsWO_INFO.RecordCount) ;
  updown1.Max:=dmcon.adsWO_INFO.RecordCount ;
  Dbgrid1.SelectedIndex :=4;
  dbgrid1.SetFocus;
end;

procedure TFrmRoutParam.DBGrid1CellClick(Column: TColumn);
begin
  Dbgrid1.SelectedIndex :=4;
end;

procedure TFrmRoutParam.DBGrid1Enter(Sender: TObject);
begin
  Dbgrid1.SelectedIndex :=4;
end;

procedure TFrmRoutParam.InitForm(rkey38: integer;str_Inst:string);
begin
  with dmcon do begin
    aqIESParam.Close;
    aqIESParam.Parameters[0].Value := rkey38;
    aqIESParam.open;
    Memo1.Text := str_Inst;
  end;
end;

procedure TFrmRoutParam.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  dmcon.adsWO_INFO.Locate('step_number',edit2.Text,[]);
end;

end.


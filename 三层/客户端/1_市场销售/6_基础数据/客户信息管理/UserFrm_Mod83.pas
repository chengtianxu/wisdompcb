unit UserFrm_Mod83;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan, Vcl.Menus,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls,Vcl.Grids;

type
  TfrmUser_Mod83 = class(TfrmBaseMain)
    Panel1: TPanel;
    btnOK: TButton;
    btnCancelPick: TButton;
    procedure ehMainDblClick(Sender: TObject);
    procedure btnCancelPickClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    FGrd:TStringGrid;
    Ftp:integer;
  public
    { Public declarations }
    Lmainsql:string;
  procedure GetData;override;
  procedure Init(Grd:TStringGrid;tp:integer);
  end;

var
  frmUser_Mod83: TfrmUser_Mod83;

implementation

{$R *.dfm}
procedure TfrmUser_Mod83.btnCancelPickClick(Sender: TObject);
begin
  inherited;
 Close;
end;

procedure TfrmUser_Mod83.btnOKClick(Sender: TObject);
begin
  inherited;
    if FGrd.RowCount = 2 then
    begin
          Self.ehMainDblClick(Sender);
          self.close;
    end
    else if  FGrd.RowCount > 2  then   self.close;
end;

procedure TfrmUser_Mod83.ehMainDblClick(Sender: TObject);
var i:integer;
begin
  try
    if Ftp=0 then
      begin
        if FGrd.RowCount = 2 then i:=1
        else i:=FGrd.RowCount-1;
      end
    else
      i:=Fgrd.row;
    FGrd.Cells[0,i]:=cdsMain.Fieldbyname('USER_LOGIN_NAME').AsString;
    FGrd.Cells[1,i]:=cdsMain.Fieldbyname('USER_FULL_NAME').AsString;
    FGrd.Cells[2,i]:=cdsMain.Fieldbyname('TPOSTION').AsString;
    FGrd.Cells[3,i]:=cdsMain.fieldbyname('rkey').AsString;
    if Ftp=0 then FGrd.RowCount:=FGrd.RowCount+1;
    cdsMain.Delete;
  finally
    if cdsMain.IsEmpty then self.close;
  end;
end;

procedure TfrmUser_Mod83.GetData;
begin
  FMainFrmSql:= Lmainsql;
  inherited;
end;

procedure TfrmUser_Mod83.Init(Grd: TStringGrid; tp: Integer);
begin
FGrd:=Grd;
Ftp:=tp;
end;
end.

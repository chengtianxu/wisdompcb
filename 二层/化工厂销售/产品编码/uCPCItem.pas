unit uCPCItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons;

type
  TformCitem = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCitem: TformCitem;

implementation

uses uDM;

{$R *.dfm}
//≤È’“
procedure TformCitem.Edit1Change(Sender: TObject);
begin
try
  //if self.Active = false then  exit;
  IF EDIT1.TEXT<>'' THEN
    IF DataModule1.ADOTabl_search.TableName ='data0002' then
      DataModule1.ADOTabl_search.Filter := 'unit_code like '''+trim(edit1.text)+'%'''
    else
      DataModule1.ADOTabl_search.Filter := 'PR_GRP_CODE like '''+trim(edit1.text)+'%'''
  ELSE
    DataModule1.ADOTabl_search.FILTER := '';
  if DataModule1.ADOTabl_search.IsEmpty then
    button1.Enabled := false
  else
    button1.Enabled := true;
except
  on E: Exception do showmessage(E.Message);
end;    
end;
//∑µªÿ
procedure TformCitem.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) and (not DataModule1.ADOTabl_search.IsEmpty) then ModalResult:=mrok;
end;

procedure TformCitem.Button1Click(Sender: TObject);
begin
  if DataModule1.ADOTabl_search.IsEmpty then
  ModalResult:=mrno;
end;

end.

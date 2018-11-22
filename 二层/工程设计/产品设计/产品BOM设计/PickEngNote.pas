unit PickEngNote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, StdCtrls, dbcgrids, ExtCtrls, DB, ADODB;

type
  TfrmPickEngNote = class(TForm)
    DBCtrlGrid1: TDBCtrlGrid;
    Label2: TLabel;
    Label3: TLabel;
    Memo: TDBMemo;
    DBEdit1: TDBEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    edtkeyValue: TEdit;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    btnYes: TButton;
    btnCancel: TButton;
    rgSearchType: TRadioGroup;
    procedure edtkeyValueChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBCtrlGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPickEngNote: TfrmPickEngNote;

implementation
uses dm;
{$R *.dfm}

procedure TfrmPickEngNote.edtkeyValueChange(Sender: TObject);
begin
  if trim(edtkeyValue.text)<>'' then
  begin
    if rgSearchType.ItemIndex = 0 then
      adoQUERY1.Filter:='inst_code like '''+trim(edtkeyValue.text)+'%'''
    else
      adoQUERY1.Filter:='Prod_Rout_Inst like ''%'+trim(edtkeyValue.text)+'%''';
  end
  ELSE
   adoQUERY1.FILTER:='';
if adoquery1.IsEmpty then
 btnyes.Enabled:=false
else
 btnyes.Enabled:=true;
end;

procedure TfrmPickEngNote.FormShow(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.Open;
if adoquery1.IsEmpty then
 btnyes.Enabled:=false
else
 btnyes.Enabled:=true;
end;

procedure TfrmPickEngNote.DBCtrlGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then  Modalresult:=mrOk;
end;

end.

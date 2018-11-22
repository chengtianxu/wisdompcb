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
uses main_062;
{$R *.dfm}

procedure TfrmPickEngNote.edtkeyValueChange(Sender: TObject);
var
  Tmpstr: string;
begin
  if trim(edtkeyValue.text) <> '' then
  begin
    if rgSearchType.ItemIndex = 0 then
      adoQUERY1.Filter := 'inst_code like ''' + trim(edtkeyValue.text) + '%'''
    else
      adoQUERY1.Filter := 'Prod_Rout_Inst like ''%' + trim(edtkeyValue.text) + '%''';
  end
  else
    adoQUERY1.FILTER := '';
end;

procedure TfrmPickEngNote.FormShow(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.Open;
end;

procedure TfrmPickEngNote.DBCtrlGrid1DblClick(Sender: TObject);
begin
  Modalresult := mrOk;
end;

end.


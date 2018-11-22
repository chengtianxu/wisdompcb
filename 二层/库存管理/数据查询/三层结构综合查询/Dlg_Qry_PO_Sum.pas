unit Dlg_Qry_PO_Sum;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, ComCtrls, RzButton, DB, DBClient;

type
  TfrmDlg_Qry_PO_Sum = class(TForm)
    Label17: TLabel;
    Label16: TLabel;
    Label1: TLabel;
    DTpk1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    ComboBox1: TComboBox;
    RadioGroup1: TRadioGroup;
    spbtnExec: TRzBitBtn;
    RzBitBtn1: TRzBitBtn;
    cdsFactory: TClientDataSet;
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDlg_Qry_PO_Sum: TfrmDlg_Qry_PO_Sum;

implementation
uses Client_FUnc,PUBFunc;
{$R *.dfm}

procedure TfrmDlg_Qry_PO_Sum.FormShow(Sender: TObject);
var
  vData:Olevariant;
  ErrorMsg:widestring;
begin
  dtpk2.Date:=date();
  dtpk1.Date:=date()-30;
  if  not coMyQuery.Get_Sql_Data('select rkey,ABBR_NAME from data0015 ',vData,ErrorMsg) then
  begin
    ShowMsg('获取工厂数据出错!',1);
    abort;
  end;
  cdsFactory.Data := vData;
  cdsFactory.Open;
  while not cdsFactory.Eof do
   begin
    combobox1.Items.Add(cdsFactory.fieldbyName('ABBR_NAME').Value);
    cdsFactory.Next;
   end;
   combobox1.Items.Add('全部...');
   combobox1.ItemIndex:=combobox1.Items.Count-1;
end;

procedure TfrmDlg_Qry_PO_Sum.ComboBox1Change(Sender: TObject);
begin
if combobox1.ItemIndex<>combobox1.Items.Count-1 then
 cdsFactory.MoveBy(combobox1.ItemIndex+1-cdsFactory.RecNo);
end;

end.

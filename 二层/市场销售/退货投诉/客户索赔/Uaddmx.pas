unit Uaddmx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons;

type
  TForm_addmx = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Edit1: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label4: TLabel;
    Edit2: TEdit;
    Label5: TLabel;
    Edit3: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Edit5: TEdit;
    ComboBox1: TComboBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit7: TEdit;
    Label11: TLabel;
    Edit8: TEdit;
    Label12: TLabel;
    Memo1: TMemo;
    Label2: TLabel;
    Edit6: TEdit;
    Label13: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ComboBox2: TComboBox;
    BitBtn2: TBitBtn;
    Label15: TLabel;
    ComboBox3: TComboBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_addmx: TForm_addmx;

implementation

uses Udemo,common,Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure TForm_addmx.BitBtn2Click(Sender: TObject);
  var inputvar: PDlgInput;
begin

 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
   InputVar.Fields := 'MANU_PART_NUMBER/本厂编号/200,MANU_PART_DESC/客户型号/200';
   InputVar.Sqlstr := 'SELECT dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC, '+
                      ' dbo.Data0025.rkey,dbo.Data0060.SALES_ORDER, dbo.Data0010.ABBR_NAME FROM dbo.Data0060 INNER JOIN '+
                      'dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.RKEY RIGHT OUTER JOIN '+
                      'dbo.Data0010 ON dbo.Data0060.ORIG_CUSTOMER = dbo.Data0010.ABBR_NAME';

   inputvar.KeyField:='MANU_PART_NUMBER';
   InputVar.AdoConn := DM.ADOConnection1 ;
   frmPick_Item_Single.InitForm_New(InputVar);
   if frmPick_Item_Single.ShowModal=mrok then
   begin
    Edit1.Text:=frmPick_Item_Single.adsPick.FieldValues['MANU_PART_NUMBER'];
    Edit1.Tag:=frmPick_Item_Single.adsPick.FieldValues['rkey'];
    Label15.Caption:='客户料号 :'+frmPick_Item_Single.adsPick.FieldValues['MANU_PART_DESC'];
   end ;
  finally
   frmPick_Item_Single.Free ;
  end;
end;

procedure TForm_addmx.SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm_addmx.ComboBox2KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['1'..'9',#8]) then key := #0 ;
end;

procedure TForm_addmx.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
   abort
  else
  if key = chr(46) then      //判断是否重复输入小数点'.'
 if pos('.',(sender as TEdit).Text)>0 then  //小数点不能重复
  abort;
end;

end.

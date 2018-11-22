unit invt_iqc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls;

type
  TForm_invt_iqc = class(TForm)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    Edit1: TEdit;
    Label6: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_invt_iqc: TForm_invt_iqc;

implementation

uses DM_u,common;

{$R *.dfm}

procedure TForm_invt_iqc.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',edit1.Text)>0  then abort;
end;

procedure TForm_invt_iqc.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Trim(Edit1.Text)<> '' then
 if StrToFloat(Edit1.Text)> DM.AQ71QUAN_ORD.Value-dm.AQ71QUAN_IN_INSP.Value then
  Edit1.Text:=FloatToStr(DM.AQ71QUAN_ORD.Value-dm.AQ71QUAN_IN_INSP.Value);
end;

procedure TForm_invt_iqc.Button1Click(Sender: TObject);
begin
  dm.tmp.Close;
  dm.tmp.SQL.Text:='select rkey,QUAN_IN_INSP from data0071 where rkey='+DM.AQ71RKEY.AsString+
  ' and QUAN_IN_INSP='+dm.AQ71QUAN_IN_INSP.AsString;
 // ShowMessage(DM.tmp.SQL.Text);
  dm.tmp.Open;
if dm.tmp.IsEmpty then
 ShowMsg('检查数量发现变化，可能多人同时操作！',1)
else
 if Trim(Edit1.Text) = '' then
  ShowMsg('检查数量不允许为空！',1)
 else
  if StrToFloat(Edit1.Text)<=0 then
   ShowMsg('检查数量必须大于零!',1)
  else
   ModalResult:=mrOk;
end;

procedure TForm_invt_iqc.FormActivate(Sender: TObject);
begin
Edit1.SelectAll;
end;

end.

unit ADED_RECE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ComCtrls, DBCtrls, Mask, DBGrids,
  Menus;

type
  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBMemo1: TDBMemo;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    DBText1: TDBText;
    Label10: TLabel;
    DBMemo2: TDBMemo;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    Edit1: TEdit;
    Label12: TLabel;
    SpeedButton1: TSpeedButton;
    DBGrid1: TDBGrid;
    Button1: TButton;
    DBEdit10: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    Button2: TButton;
    Button3: TButton;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses data_module, main, eip_search, curr_search, expressions;

{$R *.dfm}

procedure TForm2.FormActivate(Sender: TObject);
begin
edit1.Text:=dm.Aqwz303CURR_CODE.Value;
label14.Caption:=dm.Aqwz303CURR_NAME.Value;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
try
 dm.ADOConnection1.BeginTrans;
 dm.Aqwz304.UpdateBatch();
 dm.Aqwz303.Post;
 dm.ADOConnection1.CommitTrans;
except
 dm.ADOConnection1.RollbackTrans;
 showmessage('数据保存出错，可能是同一供应商的送货编号重复或者与管理员联系');
 dbedit1.SetFocus;
 exit;
end;
self.ModalResult:=mrok;
end;

procedure TForm2.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=40)             //如果是下箭头如果是最后一条记录
    and (dm.Aqwz304.RecNo=dm.Aqwz304.RecordCount) then abort;
if (key=46) and (ssCtrl in Shift) then abort;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
Form_episearch:=tForm_episearch.Create(application);

if Form_episearch.ShowModal=mrok then
 dm.Aqwz303calculate_method.Value:=Form_episearch.ListBox2.Items.Text;

Form_episearch.Free;
end;

procedure TForm2.Button1Click(Sender: TObject);
var
 i:byte;
 total_money,total:double;
begin
if dbmemo2.Lines.Count<3 then
 showmessage('请首先设定计算公式')
else
begin
total:=0;
dm.Aqwz304.DisableControls;
dm.Aqwz304.First;
while not dm.Aqwz304.Eof do
 begin
  total_money:=dm.Aqwz304.FieldValues[dbmemo2.Lines[0]];
  for i:=1 to round((dbmemo2.Lines.Count-1)/2) do
   begin
    if pos('*',dbmemo2.Lines[i*2-1])>0 then
     total_money:=total_money*dm.Aqwz304.FieldValues[dbmemo2.Lines[i*2]]
    else
     total_money:=total_money+dm.Aqwz304.FieldValues[dbmemo2.Lines[i*2]]
   end;
  dm.Aqwz304.Edit;
  dm.Aqwz304TOTAL_MONEY.Value:=total_money;
  dm.Aqwz304.Post;
  total:=total+ total_money;
  dm.Aqwz304.Next;
 end;
dm.Aqwz304.First;
dm.Aqwz303totoal_money.Value:=total;
dm.Aqwz304.EnableControls;
end;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
CURR_FORM:=Tcurr_form.Create(application);
if curr_form.ShowModal=mrok then
 begin
  dm.Aqwz303currency_ptr.Value:=curr_form.ADOQuery1RKEY.Value;
  edit1.Text:=curr_form.ADOQuery1CURR_CODE.Value;
  label14.Caption:=curr_form.ADOQuery1CURR_NAME.Value;
  dm.Aqwz303exch_rate.Value:=curr_form.ADOQuery1BASE_TO_OTHER.Value;
 end;
curr_form.Free;
end;

procedure TForm2.BitBtn1Enter(Sender: TObject);
begin
if trim(dm.Aqwz303DELIVER_NUMBER.Value)='' then
 begin
  showmessage('送货单号不能为空!');
  dbedit1.SetFocus;
  exit;
 end;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
form4:=tform4.Create(application);
if form4.ADOQuery1.IsEmpty then
 showmessage('还没有一个可用的计算公式')
else
if form4.ShowModal=mrok then
 begin
  dm.Aqwz303calculate_method.Value:= form4.ADOQuery1calculate_method.Value;
 end;
form4.Free;
end;

end.

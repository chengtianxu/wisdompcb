unit remain_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, StdCtrls, Mask, DBCtrls, ExtCtrls, ComCtrls,
  Buttons;

type
  Tform_remain = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    Label4: TLabel;
    ComboBox2: TComboBox;
    Label5: TLabel;
    dt1: TDateTimePicker;
    Label6: TLabel;
    Edit2: TEdit;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    key15: TLabel;
    key16: TLabel;
    N2: TMenuItem;
    SGrid2: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    SGrid1: TStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    procedure N1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_remain: Tform_remain;

implementation
uses damo,main,unit_inser,unit_numin,common, Unit_inser2;

{$R *.dfm}

procedure Tform_remain.N1Click(Sender: TObject);
begin
if ComboBox2.Text='' then
begin
ShowMessage('请先选择材料仓库!');
exit;
end;
try
 form_inser2:=tform_inser2.Create(application);

   dm.ADOQuery1.Close;
  dm.ADOQuery1.Open;
 form_inser2.ShowModal;
finally
 form_inser2.Free;
end;
end;

procedure Tform_remain.Button2Click(Sender: TObject);
begin
self.Close;
end;

procedure Tform_remain.N2Click(Sender: TObject);
begin
try
 form_numin:=tform_numin.Create(application);
 with form_numin do
 begin
  edit1.Text:=self.SGrid1.Cells[0,self.SGrid1.Row];
  edit2.Text:=self.SGrid1.Cells[1,self.SGrid1.Row];
  edit3.Text:=self.SGrid1.Cells[2,self.SGrid1.Row];
  edit4.Text:=self.SGrid1.Cells[3,self.SGrid1.Row];
  edit5.Text:=self.SGrid1.Cells[4,self.SGrid1.Row];
  edit6.Text:=dm.detail207tax_price.AsString;
  edit7.Text:=dm.detail207QUANTITY.AsString;
  //dt1.DateTime:=StrToDateTime(self.SGrid1.Cells[9,self.SGrid1.Row]);
  //edit1.Enabled:=false;
  edit2.Enabled:=false;
  edit5.Enabled:=false;
  edit8.Visible:=false;
  edit9.Visible:=false;


   dt1.DateTime:=StrToDateTime(FormatDateTime('yyyy-mm-dd',dm.detail207.fieldbyname('EXPIRE_DATE').Value)) ;  //有效期
   Edit10.Text:=dm.detail207.FieldByName('供应商简称').AsString+
   dm.detail207.FieldByName('SUPPLIER2').AsString+':'+
   dm.detail207.FieldByName('BARCODE_ID').AsString;      //备注


 end;
 if (form_numin.ShowModal=mrok) then
 begin
     self.SGrid1.Cells[2,self.SGrid1.Row]:=form_numin.edit3.Text;
     self.SGrid1.Cells[3,self.SGrid1.Row]:=form_numin.edit4.Text;
     self.SGrid1.Cells[0,self.SGrid1.Row]:=form_numin.edit1.Text;
 end;
  if form_numin.Edit5.Modified then
   self.SGrid1.Cells[4,self.SGrid1.Row]:=form_numin.Edit5.Text;
finally
 form_numin.Free;
end;
end;

procedure Tform_remain.N3Click(Sender: TObject);
begin
if (sgrid1.RowCount=2)and (trim(sgrid1.Cells[0,1])<>'') then
 begin
 sgrid1.Rows[1].Text:='';
 sgrid2.Rows[1].Text:='';
 end
else if sgrid1.RowCount>2 then
 begin
 form1.GridRemoveRow(sgrid1,sgrid1.Row+1);
 form1.GridRemoveRow(sgrid2,sgrid1.Row+1);
 end;
end;

procedure Tform_remain.FormShow(Sender: TObject);
begin
 //sgrid1.ColCount:=sgrid1.ColCount+3;
 sgrid1.Cells[0,0]:='余料编号';
 sgrid1.Cells[1,0]:='余料规格';
 sgrid1.Cells[2,0]:='余料纬向';
 sgrid1.Cells[3,0]:='余料经向';
 sgrid1.Cells[4,0]:='入仓数';
 sgrid1.Cells[5,0]:='供应商简称';
 sgrid1.Cells[6,0]:='单位';
 sgrid1.Cells[7,0]:='配料单号';

 sgrid1.Cells[8,0]:='有效期';
 sgrid1.Cells[9,0]:='468rkey';
 sgrid1.Cells[10,0]:='供应商ID号';
 sgrid1.Cells[11,0]:='Rkey207';

 dm.ADO556.Open;
 dm.ADO556new.Open;
 dm.ADO558add.Open;
 dm.ADO557add.Open;
 //dt1.DateTime:=strtodatetime(form1.sys_time);
 dt1.DateTime:=Now;
end;

procedure Tform_remain.ComboBox1Change(Sender: TObject);
begin
 with dm.ADOQ do
 begin
  close;
  sql.Clear;
  sql.Add('select rkey from data0015');
  sql.Add('where abbr_name='''+trim(combobox1.Text)+'''');
  open;
  key15.Caption:=fieldbyname('rkey').AsString;
 end;
end;

procedure Tform_remain.ComboBox2Change(Sender: TObject);
begin
 with dm.ADOQ do
 begin
 close;
 sql.Clear;
 sql.Add('select rkey from data0016');
 sql.Add('where location='''+trim(combobox2.Text)+'''');
 open;
 self.key16.Caption:=fieldbyname('rkey').AsString;
 end;
end;

procedure Tform_remain.Button1Click(Sender: TObject);
var
 i:byte;
 v_total :integer;
 //rucang_total :integer;
begin
 try
 //rucang_total:=0;
 v_total:=0;
//============================判断输入编号是否重复==============================
 {  if form1.find_error(trim(edit1.text)) then
   if messagedlg('入仓编号重复,可能有多台计算机同时新增,是否自动更新编号?',mtConfirmation,
   [mbYes,mbNo],0)=mrYes  then
   begin
    dm.adoin04.Close;
    dm.adoin04.Open;
    edit1.Text:=dm.adoin04SEED_VALUE.Value;
   end
  else
   begin
    edit1.SetFocus;
    exit;
   end; }

 dm.ADOConnection1.BeginTrans;  //开始一个会话期间

 { for i:=1 to sgrid1.RowCount do
  begin
  rucang_total:=rucang_total+strtoint(sgrid1.Cells[4,i]);
  end;
  Label2.Caption:=IntToStr(rucang_total);   }


 //==================增加data0558的记录=========================================
  with dm.ADO558add do
 begin
  append;
 // dm.ADO558addrema_number.Value:=edit1.Text;
  //dm.ADO558addQUAN_ON_HAND.Value:=v_total;        lms
  dm.ADO558addRKEY15.AsString:=key15.Caption;
  dm.ADO558addRKEY16.AsString:=key16.Caption;
  //dm.ADO558addremark.Value:=edit2.Text;
  dm.ADO558addttype.Value:=0;
  //dm.ADO558addtdate.Value:=dt1.DateTime;
  dm.ADO558addtdate.Value:=Now;
  dm.ADO558addempl_by_ptr.AsString:=  user_ptr;
  post;
 end;


 for i:=1 to sgrid1.RowCount-1 do
 begin


  //form1.update_04in(edit1.Text);    //更新data0004中的记录
 
 //for i:=1 to sgrid1.RowCount-1 do
 //begin
 //============================修改data0556的记录===============================
  {
  with dm.ADOQ do
  begin
   close;
   sql.Clear;
   sql.Add('select quan_on_hand from data0556');
   sql.Add('where rkey='+sgrid2.Cells[0,i]);
   open;
   edit;
   fieldbyname('quan_on_hand').Value:=fieldbyname('quan_on_hand').Value
                                      +strtoint(sgrid1.Cells[4,i]);
   post;
  end;   }


  with dm.ADO556new do
  begin
   open;
   append;
   dm.ADO556newRKEY17.AsInteger:=strtoint( sgrid2.Cells[0,sgrid1.RowCount-1]);
   dm.ADO556newMAT_CODE.AsString:=SGrid1.Cells[0,i];
   dm.ADO556newmat_desc.AsString:=SGrid1.Cells[1,i];
   dm.ADO556newLEN_SIZE.AsString:=SGrid1.Cells[2,i];
   dm.ADO556newWEI_SIZE.AsString:=SGrid1.Cells[3,i];
   dm.ADO556newquan_assign.AsInteger:=strtoint(SGrid1.Cells[4,i]);
   //dm.ADO556newSTD_COST.AsString:=SGrid1.Cells[5,i];
   dm.ADO556newREMARK.AsString:=edit2.Text;
  // dm.ADO556newREMARK.AsString:=SGrid1.Cells[5,i];
   dm.ADO556newPeiLiaoDan.AsString:=SGrid1.Cells[7,i];
   dm.ADO556newSUPP_PTR.AsString:=SGrid1.Cells[10,i];      //供应商ID
   dm.ADO556newEXPIRE_DATE.AsString:=SGrid1.Cells[8,i];    //有效期
   dm.ADO556newRkey207.AsString:=SGrid1.Cells[11,i];    //RKEY207
   dm.ADO556newTDATE.AsDateTime:=Now;
   dm.ADO556newEMPL_BY_PTR.AsString:=user_ptr;
   post;
  end;

     rkey556:=dm.ADO556newRkey.Value;


  with dm.ADOQ2 do       //更新库存
  begin
       close;
       //Parameters.ParamByName('matcode').Value:=sgrid1.Cells[0,sgrid1.RowCount-1];
       Parameters.ParamByName('matcode').Value:=SGrid1.Cells[0,i];
       Parameters.ParamByName('qnty').Value:=strtoint(sgrid1.Cells[4,i]);
       Parameters.ParamByName('rkey').Value:=dm.ADO556newRkey.Value;
       Parameters.ParamByName('LEN_SIZE').Value:=dm.ADO556newLEN_SIZE.Value;
       Parameters.ParamByName('WEI_SIZE').Value:=dm.ADO556newWEI_SIZE.Value;
       open;

  end;


//=========================增加data0557的记录===================================
  with dm.ADO557add do
  begin
   append;
   dm.ADO557addD558_PTR.AsString:=dm.ADO558addRKEY.AsString;
   dm.ADO557addNUMBER.AsString:=sgrid1.Cells[4,i];
   dm.ADO557addD556_PTR.AsInteger:=dm.ADO556newRkey.AsInteger;
   dm.ADO557addquan_on_hand.Value:=dm.ADOQ2.FieldByName('quan_on_hand').Value;
   dm.ADO557addD0468_ptr.AsString:=sgrid1.Cells[9,i];
   post;
  end;

 // =========================增加data0468状态===================================
  with  dm.ADOQuery3 do
  begin
      close;
      Parameters.ParamByName('rkey468').Value:=strtoint(sgrid1.Cells[9,i]);
      ExecSQL;
  end;

 //ShowMsg('新增操作成功!',1); 

 end; //对应for语句的begin

 dm.ADOConnection1.CommitTrans;
 except
 on e:exception do
 begin
  showmessage(e.Message);
  dm.ADOConnection1.RollbackTrans;
 end;
end;
 modalresult:=mrok;
 Form1.BitBtn2Click(Sender);
end;

procedure Tform_remain.SGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
 {
if button=mbright then
 begin
  sgrid1.MouseToCell(x,y,column,row);
  if row<>0 then sgrid1.Row:=row;
 end;       //lms      }
end;

procedure Tform_remain.PopupMenu1Popup(Sender: TObject);
begin
 if (sgrid1.Row<=1)and (trim(sgrid1.Cells[0,1])='') then
 begin
  n2.Enabled:=false;
  n3.Enabled:=false;
 end
 else
  begin
  n2.Enabled:=true;
  n3.Enabled:=true;
  end;
end;

procedure Tform_remain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
dm.ADO556.Close;
end;

procedure Tform_remain.Button1Enter(Sender: TObject);
begin
if (sgrid1.RowCount<=2) and (sgrid1.Cells[0,1]='') then
begin
showmessage('入仓记录为空，无法保存！');
sgrid1.SetFocus;
exit;
end;
end;

end.

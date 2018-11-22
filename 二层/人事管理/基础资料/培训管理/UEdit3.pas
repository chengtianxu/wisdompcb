unit UEdit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ADODB, StdCtrls, Buttons, ComCtrls, Grids,
  DBGridEh, Menus;

type
  TfrmEdit3 = class(TForm)
    pnl1: TPanel;
    qry_tp: TADOQuery;
    pnl2: TPanel;
    pnl3: TPanel;
    btn_Save: TBitBtn;
    btn_exit: TBitBtn;
    qrytemp: TADOQuery;
    pnl4: TPanel;
    lbl7: TLabel;
    lbl2: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    chk_IsFinished: TCheckBox;
    edt_remark: TEdit;
    cbb_TType: TComboBox;
    edt_tc: TEdit;
    edt_DName: TEdit;
    btn_selDTC: TBitBtn;
    lbl_CName: TLabel;
    lbl8: TLabel;
    edt_PName: TEdit;
    Label4: TLabel;
    BDate: TDateTimePicker;
    BTime: TDateTimePicker;
    Label5: TLabel;
    EDate: TDateTimePicker;
    ETime: TDateTimePicker;
    Label1: TLabel;
    edt_TTeacher: TEdit;
    Label8: TLabel;
    edt_TPlace: TEdit;
    Label2: TLabel;
    edt_THOurs: TEdit;
    lbl1: TLabel;
    edt_PMonth: TEdit;
    atncfld_tprkey: TAutoIncField;
    intgrfld_tpTC_ptr: TIntegerField;
    intgrfld_tpTtype: TIntegerField;
    strngfld_tpPMonth: TStringField;
    strngfld_tpremark: TStringField;
    qry_tpIsFinished: TBooleanField;
    intgrfld_tpDeptID: TIntegerField;
    intgrfld_tpPostID: TIntegerField;
    dtmfld_tpBDate: TDateTimeField;
    dtmfld_tpBTime: TDateTimeField;
    dtmfld_tpEDate: TDateTimeField;
    dtmfld_tpETIme: TDateTimeField;
    strngfld_tpTeacher: TStringField;
    strngfld_tpPlace: TStringField;
    fltfld_tpTHours: TFloatField;
    intgrfld_tpEmployeeID: TIntegerField;
    lbl3: TLabel;
    Pdate: TDateTimePicker;
    dtmfld_tpPDate: TDateTimeField;
    procedure btn_exitClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_selDTCClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    FEditType:integer;
    procedure GetData(ARkey:string);     
  end;

var
  frmEdit3: TfrmEdit3;

implementation
   uses udm, common,Pick_Item_Single,ConstVar;
{$R *.dfm}

{ TfrmEdit }

procedure TfrmEdit3.GetData(ARkey: string);
var Lsql:string;
begin
  Lsql:='select   * from trainPlan where rkey='+ARkey;
  dm.OpenQry(qry_tp,Lsql);

  Lsql :=' select  a.rkey, a.PMonth,a.Bdate,a.BTime, a.EDate,a.ETime,'+
        ' a.TC_ptr,a.Ttype,a.remark,a.DeptID,a.PostID,a.Teacher,a.place,a.THours,'+
        ' case when a.IsFinished=0  then  ''未完成'' else ''已完成'' end as IsFinished ,'+
       // ' f3.item as ctype2 ,'+
        ' c.ccode,c.cname, e.departmentname,f2.item as item2'+
        ' from   TrainPlan a'+
        ' inner join trainclass c on c.rkey=a.tc_ptr'+
        ' inner join datadepartment e  on e.rkey=a.DeptId'+
       // ' inner join datadetail f on f.rkey=a.PostID'+
        ' inner join datadetail f2 on f2.rkey=a.ttype'+
       // ' inner join datadetail f3 on f3.rkey=c.ctype2'+
      ' where  f2.dictid=20  and  a.rkey='+arkey;
  dm.OpenQry(qrytemp,Lsql);

   Lsql:='select rkey,item  from datadetail where dictid=20 ';
  Dm.OpenQry(DM.qry_temp,Lsql);
  if not dm.qry_temp.IsEmpty  then
  begin
   cbb_TType.Items.Clear;
   while not dm.qry_temp.eof do
   begin
   cbb_TType.Items.AddObject(dm.qry_temp.fieldByName('item').AsString, Tobject(dm.qry_temp.fieldbyname('rkey').asinteger));
   DM.qry_temp.Next;
   end;
   cbb_TType.ItemIndex:=-1;
  end
     else
   cbb_TType.Text:='普通';

  if FEditType =1  then
  begin
    edt_THOurs.Text:='0';
  end
  else  if FEditType >1  then
  begin
   cbb_TType.ItemIndex:= cbb_TType.Items.IndexOfObject(TObject(qrytemp.Fieldbyname('ttype').AsInteger));
   edt_DName.Text:=qrytemp.fieldbyname('departmentName').asstring;
  //edt_PName.Text:=qrytemp.fieldbyname('item').asstring;
   edt_DName.Tag:=qrytemp.fieldbyname('DeptID').asinteger;
   edt_PName.tag:=qrytemp.fieldbyname('PostID').asinteger;
   edt_tc.Text:=qrytemp.fieldbyname('ccode').asstring;
   lbl_CName.Caption:=qrytemp.fieldbyname('Cname').asstring;
   edt_tc.Tag:=qrytemp.fieldbyname('tc_ptr').asinteger;
   edt_PMonth.Text:=qrytemp.fieldbyname('PMonth').asstring;

   if not qrytemp.fieldbyname('BDate').IsNull then
   bdate.Date:=qrytemp.fieldbyname('BDate').AsDateTime;
   if not qrytemp.fieldbyname('EDate').IsNull then
   Edate.Date:=qrytemp.fieldbyname('EDate').AsDateTime;
   if not qrytemp.fieldbyname('BTime').IsNull then
   BTime.Date:=qrytemp.fieldbyname('Btime').AsDateTime;
   if not qrytemp.fieldbyname('ETime').IsNull then
   ETime.Date:=qrytemp.fieldbyname('Etime').AsDateTime;

   edt_TPlace.Text:= qrytemp.fieldbyname('place').Asstring;
   edt_TTeacher.Text:= qrytemp.fieldbyname('teacher').Asstring;

   if   qrytemp.fieldbyname('thours').Asfloat> 0  then
    edt_THOurs.Text:=qrytemp.fieldbyname('thours').Asstring
    else
    edt_THOurs.Text:='0';
    
   edt_remark.Text:=qrytemp.fieldbyname('remark').Asstring;
   chk_IsFinished.Checked:=qrytemp.fieldbyname('IsFinished').AsBoolean;
  end


end;

procedure TfrmEdit3.btn_exitClick(Sender: TObject);
begin
close;
end;

procedure TfrmEdit3.btn_SaveClick(Sender: TObject);
begin

   if not dm.Isnum(Trim(edt_THOurs.text))   then
   begin
   showmessage('请输入数字！');
   edt_THOurs.SetFocus;
   exit;
   end;

  if FEditType=1 then
  qry_tp.Append
  else
  qry_tp.Edit;

  //字段赋值
  //qry_tp.FieldByName('employeeid').Value:=edt_eCode.Tag;
  qry_tp.FieldByName('tc_ptr').Value:=edt_tc.Tag;
  qry_tp.FieldByName('ttype').Value:= Integer(cbb_ttype.Items.Objects[cbb_ttype.itemindex]);
  qry_tp.FieldByName('remark').Value:=Trim(edt_remark.Text);

  if (FormatDateTime('yyyy-MM-dd',BDate.Date))>'2000-01-01' then
  qry_tp.FieldByName('BDate').Value:=StrToDateTime(FormatDateTime('yyyy-MM-dd',BDate.Date));

  if (FormatDateTime('yyyy-MM-dd',EDate.Date))>'2000-01-01' then
  qry_tp.FieldByName('EDate').Value:=StrToDateTime(FormatDateTime('yyyy-MM-dd',EDate.Date));

   if (FormatDateTime('yyyy-MM-dd',BTime.Date))>'2000-01-01' then
  qry_tp.FieldByName('BTime').Value:=StrToDateTime(FormatDateTime('yyyy-MM-dd',BTime.Date));

   if (FormatDateTime('yyyy-MM-dd',ETime.Date))>'2000-01-01' then
  qry_tp.FieldByName('ETIme').Value:=StrToDateTime(FormatDateTime('yyyy-MM-dd',ETime.Date));
  
  qry_tp.FieldByName('Pmonth').Value:=trim(edt_pmonth.text);
  qry_tp.FieldByName('place').Value:=Trim(edt_TPlace.text);
  qry_tp.FieldByName('Thours').Value:=StrToFloat((edt_THOurs.Text));


  qry_tp.post;
  qry_tp.UpdateBatch(arall);
  
 self.ModalResult:=mrOk;
end;

procedure TfrmEdit3.btn_selDTCClick(Sender: TObject);
var
  InputVar:PDlgInput;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'ccode/课程编号/120,cname/课程名/120';
    InputVar.Sqlstr := 'select rkey,ccode,cname '+
                    ' from   trainclass ';
    Inputvar.KeyField:='';
    InputVar.AdoConn := dm.con ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edt_tc.Text:= frmPick_Item_Single.adsPick.fieldbyname('ccode').AsString;
      lbl_cname.Caption:= frmPick_Item_Single.adsPick.fieldbyname('cname').AsString;
      edt_tc.Tag:=frmPick_Item_Single.adsPick.fieldbyname('rKey').AsInteger;
    end;
  finally
    frmPick_Item_Single.Free;
  end;

end;

end.

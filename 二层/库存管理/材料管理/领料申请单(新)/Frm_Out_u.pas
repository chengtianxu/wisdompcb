unit Frm_Out_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGridEh, ExtCtrls,DateUtils, DB,
  ADODB;

type
  TFrm_out = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label5: TLabel;
    Edit5: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    ComboBox1: TComboBox;
    lbl1: TLabel;
    cbb_BZ: TComboBox;
    grp1: TGroupBox;
    lbl2: TLabel;
    edt1: TEdit;
    lbl4: TLabel;
    edt2: TEdit;
    lbl5: TLabel;
    edt3: TEdit;
    lbl6: TLabel;
    edt_standard: TEdit;
    lbl7: TLabel;
    edt_remark: TEdit;
    lbl3: TLabel;
    edit4: TEdit;
    lbl8: TLabel;
    mmo1: TMemo;
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure cbb_BZChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Frm_out: TFrm_out;

implementation

uses DM_u, Frm_detailEdt_u, Frm_detail_u;

{$R *.dfm}

procedure TFrm_out.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','.',#8]) then
  begin
    key:=#0;
    abort;
  end;
end;

procedure TFrm_out.BitBtn2Click(Sender: TObject);
var
  i,CType:Integer;
begin
 //
 // OutputDebugString(PChar('aaa='+inttostr(aaa)+',bbb='));
    
  if (trim(cbb_bz.Text)='') and (cbb_bz.items.count>0)  then
  begin
    showmessage('请选择领料标准');
    cbb_bz.SetFocus;
    exit;
  end;


//  if  copy(trim(cbb_bz.Text),0,1)='X' then
//  begin
//    showmessage('要按标准领的料没设置标准不能领料！请找IE建立标准。');
//    
//    exit;
//  end;


  if strtofloat('0'+trim(edit5.Text))=0 then
  begin
    showmessage('出库数量不能为0...');
    edit5.SetFocus;
    exit;
  end;


  if strtofloat('0'+trim(edit5.Text))>strtofloat(Edit4.text) then
  begin
    showmessage('出库数量不能不能大于有效库存！');
    edit5.SetFocus;
    exit;
  end;

//  if Copy(trim(edt_remark.Text),0,1)='X' then
//  begin
//    if MessageDlg('申领频率不合标准，需要继续保存吗？',mtInformation, [mbYes,mbNo],0)= mryes then
//    //
//    else
//    exit;
//  end;

// if (Copy(edt_remark.Text,0,1) <> 'V') and (trim(edt3.text)<>'')   then    //  and (Copy(edt_remark.Text,0,1) <> 'X')
// begin
//  if ( strtofloat(Edit5.text)>strtofloat(edt3.text)) then
//  begin
//
//    if MessageDlg('申领数量不符合标准:申领数量不能大于可领料数量，需要继续保存吗？',mtInformation, [mbYes,mbNo],0)= mryes then
//     begin
//     edt_remark.text:='X申领数量大于可领数量,领料标准:'+edt_remark.text;
//     //showmessage(edt_remark.text);
//     end
//    else
//    exit;
//  end;
// end;

  modalresult:=mrok;
end;

procedure TFrm_out.cbb_BZChange(Sender: TObject);
begin
  if Trim(cbb_BZ.Text)=''  then exit;

 //取得数量：
     if  (Trim(cbb_BZ.Text)<>'') and    (Copy(cbb_bz.Text,0,1) <> 'V') and (Copy(cbb_bz.Text,0,1) <> 'X')   then
      with dm.sp1 do
      begin
      dm.sp1.close;
      dm.sp1.Parameters.ParamByName('@CType').Value:=IntToStr(Integer(cbb_BZ.Items.Objects[cbb_BZ.itemindex]));
      dm.sp1.Parameters.ParamByName('@warehouse_ptr').Value:=Frm_detail.CBFac.tag  ;
      dm.sp1.Parameters.ParamByName('@control_ptr').Value:=cbb_bz.Tag;
      dm.sp1.Parameters.ParamByName('@cost_ptr').Value:=Frm_detail.EdtDept.tag  ;
     // dm.sp1.Parameters.ParamByName('@invt_ptr').Value:=Edit1.tag  ;
      dm.sp1.Parameters.ParamByName('@ReqDate').Value:=strtodate(formatdatetime('yyyy-MM-dd',Frm_detail.DateTimePicker1.date))  ;
      dm.sp1.Parameters.ParamByName('@nowqty').Value:=0;
      dm.sp1.Parameters.ParamByName('@AllQty').Value:=0;
      dm.sp1.Parameters.ParamByName('@GetQty').Value:=0;
      dm.sp1.Parameters.ParamByName('@QCQty').Value:=0;
      dm.sp1.Parameters.ParamByName('@smessage').Value:='';
      ExecProc;
     // showmessage((FormatDateTime('yyyy-MM-dd',Frm_detail.DateTimePicker1.date)));
      edt1.text:=floatToStr(dm.sp1.Parameters.ParamByName('@AllQty').Value);
      edt2.text:=floatToStr(dm.sp1.Parameters.ParamByName('@GetQty').Value);
    //  mmo1.text:= TrimLeft(dm.sp1.Parameters.ParamByName('@smessage').Value);
      if dm.sp1.Parameters.ParamByName('@AllQty').Value-dm.sp1.Parameters.ParamByName('@GetQty').Value-dm.sp1.Parameters.ParamByName('@QCQty').Value<0  then
        edt3.text:='0'
      else
      edt3.text:=floatToStr(dm.sp1.Parameters.ParamByName('@AllQty').Value-dm.sp1.Parameters.ParamByName('@GetQty').Value-dm.sp1.Parameters.ParamByName('@QCQty').Value);

      //edt_remark.text:=TrimLeft(dm.sp1.Parameters.ParamByName('@smessage').Value+' '+cbb_BZ.Text+' :可领数量:'+edt1.Text+';已领数量:'+edt2.Text+ ';还剩可领数:' +edt3.Text);
      edt_remark.text  :=dm.sp1.Parameters.ParamByName('@QCQty').Value;
     
      end

end;

procedure TFrm_out.FormCreate(Sender: TObject);
begin
mmo1.text:='';
end;

end.

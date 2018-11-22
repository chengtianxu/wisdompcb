unit insert_wo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    Label5: TLabel;
    Edit3: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label6: TLabel;
    Edit4: TEdit;
    BitBtn2: TBitBtn;
    Label7: TLabel;
    Label8: TLabel;
    Edit5: TEdit;
    Label9: TLabel;
    Edit6: TEdit;
    Label10: TLabel;
    Edit7: TEdit;
    rkey06: TLabel;
    rkey25: TLabel;
    flow_no: TLabel;
    dept_ptr: TLabel;
    step: TLabel;
    RadioGroup1: TRadioGroup;
    Label11: TLabel;
    Edit8: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Edit8Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    system_panels:integer;
  end;

var
  Form4: TForm4;

implementation

uses demo, part_search, wo_search, dept_search, wipwo_search;

{$R *.dfm}

procedure TForm4.BitBtn1Click(Sender: TObject);
begin
if radiogroup1.ItemIndex=1 then    //非在线工单
 try
  form5:=tform5.Create(application);
  if form5.ShowModal=mrok then
   begin
    form6:=tform6.Create(application);
    form6.ADOQuery1.Close;
    form6.ADOQuery1.Parameters[0].Value:=form5.ADOQuery1RKEY.Value;
    form6.ADOQuery1.Parameters[1].Value:=dm.ADP400whouse_ptr.Value;
    form6.ADOQuery1.Open;
    if form6.ADOQuery1.IsEmpty then
     messagedlg('对不起!该产品没有已入仓的工作定单!',mtinformation,[mbok],0)
    else
    if form6.ShowModal=mrok then
     begin
      if strtoint(rkey06.Caption)<>form6.ADOQuery1RKEY.Value then
       begin
        edit1.Text:=form5.ADOQuery1MANU_PART_NUMBER.Value;
        label3.Caption:=form5.ADOQuery1MANU_PART_NUMBER.Value;
//        edit2.Text:=form5.ADOQuery1CP_REV.Value;
        edit7.Text:=form5.ADOQuery1ABBR_NAME.Value;
        edit3.Text:=form6.ADOQuery1WORK_ORDER_NUMBER.Value;
        edit5.Text:=form6.ADOQuery1QUAN_sch.AsString;
        edit8.Text:=form6.adoquery1panels.asstring;
        system_panels:=form6.ADOQuery1panels.Value;//系统pan数量
        rkey06.Caption:=form6.ADOQuery1RKEY.AsString;
        rkey25.Caption:=form5.ADOQuery1RKEY.AsString;
        flow_no.Caption:=form6.ADOQuery1FLOW_NO.AsString;
        edit4.Text:='';
        label7.Caption:='';
        dept_ptr.Caption:='0';
        step.Caption:='0';
        bitbtn2.Enabled:=true;
        bitbtn2.SetFocus;
       end
      else
       begin
        bitbtn2.SetFocus;
       end;
     end;
    form6.Free;
   end;
 finally
  form5.Free;
 end
else          //在线工单
 try
  form5:=tform5.Create(application);
  if form5.ShowModal=mrok then
   begin
    form10:=tform10.Create(application);
    form10.ADOQuery1.Close;
    form10.ADOQuery1.Parameters[0].Value:=dm.ADP400rkey.Value;
    form10.ADOQuery1.Parameters[1].Value:=form5.ADOQuery1RKEY.Value;
    form10.ADOQuery1.Open;
    if form10.ADOQuery1.IsEmpty then
     messagedlg('对不起!该产品没有被删除的在线工作定单!',mtinformation,[mbok],0)
    else
    if form10.ShowModal=mrok then
     begin
      if strtoint(rkey06.Caption)<>form10.ADOQuery1RKEY.Value then
      begin
       edit1.Text:=form5.ADOQuery1MANU_PART_NUMBER.Value;
       label3.Caption:=form5.ADOQuery1MANU_PART_NUMBER.Value;
//       edit2.Text:=form5.ADOQuery1CP_REV.Value;
       edit7.Text:=form5.ADOQuery1ABBR_NAME.Value;
       edit3.Text:=form10.ADOQuery1WORK_ORDER_NUMBER.Value;
       edit5.Text:=form10.ADOQuery1system_quan.AsString;
       edit8.Text:=form10.ADOQuery1panels.AsString;//清点pan数量
       system_panels:=form10.ADOQuery1panels.Value;//系统pan数量
       rkey06.Caption:=form10.ADOQuery1RKEY.AsString;
       rkey25.Caption:=form5.ADOQuery1RKEY.AsString;
       flow_no.Caption:=form10.ADOQuery1FLOW_NO.AsString;
       edit4.Text:='';
       label7.Caption:='';
       dept_ptr.Caption:='0';
       step.Caption:='0';
       bitbtn2.Enabled:=true;
       bitbtn2.SetFocus;
      end
      else
       begin
        bitbtn2.SetFocus;
       end;
     end;
    form10.Free;
   end;
 finally
  form5.Free;
 end;
 end;

procedure TForm4.BitBtn2Click(Sender: TObject);
begin
try
 form7:=tform7.Create(application);
 form7.ADOQuery1.Close;
 form7.ADOQuery1.Parameters[0].Value := strtoint(rkey25.Caption);
 form7.ADOQuery1.Parameters[1].Value := strtoint(flow_no.Caption);
 form7.ADOQuery1.Open;
 if form7.ShowModal=mrok then
  begin
   edit4.Text:=form7.ADOQuery1DEPT_CODE.Value;
   label7.Caption:=form7.ADOQuery1DEPT_NAME.Value;
   dept_ptr.Caption:=form7.ADOQuery1RKEY.AsString;
   step.Caption:=form7.ADOQuery1STEP_NUMBER.AsString;
  end;
finally
 form7.Free;
end;
end;

procedure TForm4.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8]) then  //判断是否输入数字
  abort
end;

procedure TForm4.Edit6Exit(Sender: TObject);
begin
 if trim(edit6.Text)='' then edit6.Text := '0';
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
if strtoint(step.Caption)= 0 then
 begin
  messagedlg('请输入当前工单所在工序!',mtinformation,[mbok],0);
  edit4.SetFocus;
 end
else
 if strtoint(edit6.Text)<=0 then
  begin
   messagedlg('新增盘点数量必需大于零!',mtinformation,[mbok],0);
   edit6.SetFocus;
  end
 else
  ModalResult:=mrok;
end;

procedure TForm4.RadioGroup1Click(Sender: TObject);
begin
 rkey06.Caption:='0';
 rkey25.Caption:='0';
 flow_no.Caption:='0';
 dept_ptr.Caption:='0';
 step.Caption:='0';
 edit1.Text:='';
 label3.Caption :='';
// edit2.Text :='';
 edit7.Text :='';
 edit3.Text :='';
 edit4.Text :='';
 label7.Caption :='';
 bitbtn2.Enabled :=false;
 edit5.Text :='';
 edit6.Text :='0';
end;

procedure TForm4.Edit8Exit(Sender: TObject);
begin
 if trim(edit8.Text)='' then edit8.Text := '0';
end;

end.

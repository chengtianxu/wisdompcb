unit card_add_u;

interface

uses
  SysUtils, Variants, Classes, Controls, Forms,
  Dialogs, Mask, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  Tfrm_card_add = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit2: TEdit;
    BitBtn2: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    CheckBox1: TCheckBox;
    Label11: TLabel;
    dtp: TDateTimePicker;
    cantype: TRadioGroup;
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure cantypeClick(Sender: TObject);
   

  
 
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_card_add: Tfrm_card_add;

implementation
 uses common,damo,Pick_Item_Single,ConstVar;
{$R *.dfm}





procedure Tfrm_card_add.Button1Click(Sender: TObject);
var  modify_card_time : Tdatetime;
begin
  dm.ADOTMP_DEL.SQL.Text := ' insert into meal_orginaldata '+
  ' (empno,card_time,date_e,time_e,dev_id,empid,remark1,remark2,factorytype)'+
  '  select '+ quotedstr(Edit1.Text)+','+
  quotedstr(FormatDateTime(dtp.Format,dtp.DateTime))+','+
  quotedstr(FormatDateTime('yyy-MM-dd',dtp.Date))+','+
  quotedstr(FormatDateTime('HH:mm:ss',dtp.Time))+','+
  quotedstr(Edit2.Text)+','+
  Label4.Caption+','+
  Label9.Caption+','+ user_ptr+
  ','+quotedstr(Label5.Caption);
  //showmessage(dm.ADOTMP_DEL.SQL.Text);
  if Messagedlg('你确定给'+Edit1.Text+'添加'+quotedstr(FormatDateTime(dtp.Format,dtp.DateTime))+'吗?',mtWarning,[mbYES,mbNO],0)=6 then
  begin
    try
      dm.ADOTMP_DEL.ExecSQL;
      showmessage('添加成功');
      Edit1.Text :='';
      Label4.Caption:='0';
      Label3.Caption:='';
      except
        showmessage('添加失败');
      end;
  end;
        //

  //frm_card_add.Free;
  if checkbox1.checked then
  begin
   DM.ADOTMP.Active := False;;
   DM.ADOTMP.Active := true;
  end;



 
  
end;


procedure Tfrm_card_add.BitBtn1Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case Tcomponent(Sender).Tag of
    0:
    begin
      InputVar.Fields := 'employeecode/员工工号/150,departmentname/部门/150,chinesename/员工姓名/100';
      InputVar.Sqlstr :='select * from (select rkey,employeecode,departmentname,'+
        ' chinesename,'+quotedstr('local')+' as  factorytype from v_employeemsg '+
        '  where (status=1 or outdutytime>= dateadd(month,-2,getdate()) )union select rkey,employeecode,factoryarea,chinesename,'+
        quotedstr('extra')+' as factorytype from  employeemsg_extra where flag=1 ) as b  ';
    end;
    1:
    begin
      InputVar.Fields := 'devid/机器号/50,dev_ip/机器IP/150,position/机器位置/150';
      InputVar.Sqlstr := 'select * from dev_detail where devaddr='+#39+'local'+#39+
      '  and  (purpose='+quotedstr('m')+' ) and (not (price  is null))';
    end;
  end;
  InputVar.AdoConn := dm.ADOConnection1;
  frmPick_Item_Single.InitForm_New(InputVar);

  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case Tcomponent(Sender).Tag of
     0:begin
         edit1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['employeecode']);
         label3.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['chinesename']);
         label4.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['rkey']);
         label5.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['factorytype']);
       end;
     1:begin
         edit2.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['devid']);
         label8.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['devid']);
         label9.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['mealtype']);
       end;
    end;
  end ;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;

end;

procedure Tfrm_card_add.cantypeClick(Sender: TObject);
begin
  case cantype.ItemIndex of
  0: dtp.Time:=StrToTime('08:00:00');
  1: dtp.Time:=StrToTime('12:00:00');
  2: dtp.Time:=StrToTime('17:30:00');
  3: dtp.Time:=StrToTime('23:30:00');
  end;
end;

end.

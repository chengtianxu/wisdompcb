unit card_add_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, Buttons;

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
    MaskEdit1: TMaskEdit;
    Label7: TLabel;
    Edit2: TEdit;
    BitBtn2: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
   

  
 
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_card_add: Tfrm_card_add;

implementation
 uses common,damo,Pick_Item_Single,ConstVar, main_u;
{$R *.dfm}





procedure Tfrm_card_add.Button1Click(Sender: TObject);
var  modify_card_time : Tdatetime;
begin
{提示是否确定补卡，确定之后tag=1  modalresult := mrok;}
if maskedit1.Text = '    -  -     :  :  '  then
  begin
    showmessage('补卡时间不能为空...');
    maskedit1.SetFocus;
    abort;
  end;
if edit1.Text = ''  then
  begin
    showmessage('工号不能为空...');
    abort;
  end;

if (TryStrToDateTime(maskedit1.Text, modify_card_time) = False) then
  begin
    ShowMessage('不是合法日期时间');
    maskedit1.SetFocus;
    abort;
  end;
  
  begin
    if ((frm_card_add.Edit1.Text <>'') and ( frm_card_add.MaskEdit1.Text <> '    -  -     :  :  ') ) then
      begin
        dm.ADOTMP_DEL.SQL.Text := ' insert into meal_orginaldata '+
        ' (empno,card_time,date_e,time_e,dev_id,empid,remark1,remark2,factorytype)'+
        '  select '+ quotedstr(frm_card_add.Edit1.Text)+','+
        quotedstr(frm_card_add.MaskEdit1.Text)+', left('+
        quotedstr(frm_card_add.MaskEdit1.Text)+',10) ,right('+
        quotedstr(frm_card_add.MaskEdit1.Text)+',8) ,'+
        quotedstr(frm_card_add.Edit2.Text)+','+
        frm_card_add.Label4.Caption+','+
        frm_card_add.Label9.Caption+','+ user_ptr+
        ','+quotedstr(frm_card_add.Label5.Caption);
        //showmessage(dm.ADOTMP_DEL.SQL.Text);
        //
        if Messagedlg('你确定给'+frm_card_add.Edit1.Text+'添加'+quotedstr(frm_card_add.MaskEdit1.Text)+'吗?',mtWarning,[mbYES,mbNO],0)=6 then
        begin
          try
            dm.ADOTMP_DEL.ExecSQL;
            showmessage('添加成功');
            frm_card_add.Edit1.Text :='';
            frm_card_add.Label4.Caption:='0';
            frm_card_add.Label3.Caption:='';
            frm_main.str_addtime := frm_card_add.MaskEdit1.Text  ;
            except
              showmessage('添加失败');
            end;
        end;
        //
      end;
  end;

  //frm_card_add.Free;
  if checkbox1.checked then
  begin
   DM.ADOTMP.SQL.Text := frm_main.sSql_meal_topmakecard;
   DM.ADOTMP.Active := true;
  end;
  if not dm.ADOTMP.IsEmpty
    then
      begin
        frm_main.edit1.Enabled := true;
        frm_main.field_name := frm_main.dbgrideh1.Columns[0].FieldName;
        frm_main.PreColumn := frm_main.dbgrideh1.Columns[0];
        frm_main.label2.Caption := inttostr(frm_main.dbgrideh1.DataSource.DataSet.RecordCount);
        frm_main.dbgrideh1.PopupMenu := frm_main.popupmenu1;
      end;
  frm_main.radiogroup1.ItemIndex := 4;

 
  
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
      '  and  purpose='+quotedstr('m');
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

procedure Tfrm_card_add.Button2Click(Sender: TObject);
begin
frm_main.card_add_flag := 0;
close;
end;


end.

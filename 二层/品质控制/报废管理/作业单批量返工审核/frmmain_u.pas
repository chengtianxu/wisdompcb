unit frmmain_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,common, Buttons, ExtCtrls, Grids, DBGridEh, Menus;

type
  Tfrm_main = class(TForm)
    pnl1: TPanel;
    DBGrid1: TDBGridEh;
    radiogroup1: TRadioGroup;
    btn1: TBitBtn;
    btn2: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    procedure radiogroup1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    {procedure N2Click(Sender: TObject);}
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure btn1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    tel,name1:string;
    sql_text:string;
  public
    { Public declarations }
  end;

var
  frm_main: Tfrm_main;

implementation

uses auth_info, damo, ufrm_detail;

{$R *.dfm}

procedure Tfrm_main.radiogroup1Click(Sender: TObject);
begin
dm.ADS203.Close;
dm.ADS203.Parameters[0].Value:=strtoint(user_ptr_dept);
dm.ADS203.Parameters[1].Value:=strtoint(user_ptr_dept);
dm.ADS203.Parameters[2].Value:=strtoint(user_ptr);
dm.ADS203.Parameters[3].Value:=strtoint(user_ptr_dept);
//ShowMessage(DM.dsADS203.CommandText);

if radiogroup1.ItemIndex=0 then
 dm.ADS203.CommandText:=sql_text+' and Data0260.auth_flag =1'
else
 dm.ADS203.CommandText:=sql_text;
 //ShowMessage(dm.dsADS203.CommandText);
 dm.ADS203.Open;
end;

procedure Tfrm_main.FormCreate(Sender: TObject);
begin
//{}
 if not app_init_2(dm.ADOConnection1) then
   begin
    showmsg('程序起动失败,请联系管理员!',1);
    application.Terminate;
   end;
  self.caption:=application.Title;
//  dm.ADOConnection1.Open;
//  user_ptr_dept := '75';
//  rkey73:= '4108';
//  user_ptr:='4508';
//  vprev:= '4';
//
//  dm.ADOConnection1.Open;
//  user_ptr_dept := '11';
//  rkey73:= '3685';
//  user_ptr:='4330';
//  vprev:= '4';



  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  sql_text:=dm.ADS203.CommandText;
  //OldGridWnd := DBGrid1.WindowProc;
  //DBGrid1.WindowProc := NewGridWnd;
end;

procedure Tfrm_main.FormShow(Sender: TObject);
begin
  RadioGroup1Click(Sender);
end;

procedure Tfrm_main.N1Click(Sender: TObject);
var     str:string;
        finally_ad_flag : integer;
begin
  if (strtoint(vprev) = 1) or (strtoint(vprev) = 3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限', mtinformation, [mbok], 0);
    abort;
  end;
  finally_ad_flag := 0 ;
  dm.ADOQuery1.SQL.Clear;
  dm.ADOQuery1.SQL.Text := ' select top 1 seq_no,Information from data0260  where rkey203='
    +dm.ADS203rkey203.AsString+' order by seq_no desc ';
  dm.ADOQuery1.Open;
  if dm.ADOQuery1.FieldByName('seq_no').Value = dm.ADS203seq_no.Value  then
  if messagedlg('终审操作是不可逆操作,你确定吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
     finally_ad_flag := 1
  else  exit ;
  if dm.ADS203auth_flag.Value then
    try
     str := InputBox('审批意见','','');
     dm.ADOConnection1.BeginTrans;
     dm.ADS203.Edit;
     dm.ADS203auth_flag.Value := false;  //260是否为当前审批部门
     dm.ADS203auth_date.Value := getsystem_date(dm.adoquery1,0); // 评审日期授权日期服务器时间78
     dm.ADS203user_ptr260.Value := strtoint(user_ptr);//评审用户0005
     dm.ADS203puth_info.Value := str;//评审备注
     dm.ads260.Close;
     dm.ads260.Open;
      while not dm.ads260.Eof do
      begin

       if dm.ads260seq_no.Value-dm.ADS203seq_no.Value = 1 then
        begin               //给下一个审批用户赋值
         dm.ads260.Edit;
         dm.ads260auth_flag.Value := true;
         dm.ads260.Post;
          with DM.ADOQuery3 do
          begin
            Close;
            sql.clear;
            SQL.Add('declare @classid as int');
            SQL.Add('INSERT INTO data0014([MESSAGE],senddate,whosend) VALUES(''返工申请需要您审核'',GETDATE(),'+rkey73+')'+'select @classid=@@identity');
            SQL.Add('INSERT INTO data0314(emp_ptr,d14_ptr)VALUES('+dm.ads260.fieldbyname('Information').AsString+','+ '@classid'+')');
            ExecSQL;
          end;

          DM.del.Close;
          DM.del.Parameters[0].Value:=dm.ads260.fieldbyname('Information').Value;
          DM.del.Open;
          tel:=DM.delPHONE.AsString;

          DM.del.Close;
          DM.del.Parameters[0].Value:=StrToInt(rkey73);
          DM.del.Open;
          name1:=DM.delEMPLOYEE_NAME.Value;
         break;
        end
       else
        if dm.ads260.RecNo=dm.ads260.RecordCount then//如果是最后一条记录
       begin
         dm.ADS203status.Value := 2;//表示报价已经完成审批
         DM.ADO239.Close;
         DM.ADO239.Parameters[0].Value:=DM.ADS203rkey203.Value;   //返工工序明细
         DM.ADO239.Open;
         if not DM.ADO239.IsEmpty then
         begin
          dm.qry1.Close;
          dm.qry1.Parameters[0].Value := dm.ADS203rkey203.Value;  //有返工流程
          dm.qry1.ExecSQL;
         end
         else
         begin
          dm.qry2.Close;
          dm.qry2.Parameters[0].Value := dm.ADS203rkey203.Value;
          dm.qry2.ExecSQL;
         end;
         //审批完成 239 表生成到 238 表，用IF EXISIT
         //终审要提示
       end;
       dm.ads260.Next;
      end;
       dm.ads203.Post;
       dm.ADOConnection1.CommitTrans;

       DM.tmp.Close;
       DM.tmp.SQL.Text:='SELECT dbo.Data0006.WORK_ORDER_NUMBER, dbo.Data0006.wtype, dbo.Data0006.PROD_STATUS, dbo.DATA0203.rkey '+
                         'FROM dbo.DATA0203 INNER JOIN '+
                      'dbo.DATA0252 ON dbo.DATA0203.rkey = dbo.DATA0252.rkey203 INNER JOIN '+
                      'dbo.Data0006 ON dbo.DATA0252.rkey06 = dbo.Data0006.RKEY where dbo.DATA0203.rkey= '+dm.ADS203rkey203.AsString;
     dm.tmp.Open;


       //终审自动刷新
       if finally_ad_flag=1 then
       begin
        dm.ads203.Close;
        dm.ads203.Open;
        end;
    except
      dm.ADOConnection1.RollbackTrans;
      messagedlg('审批操作不成，请退出后再来一次',mtinformation,[mbok],0);
      dm.ads203.Close;
      dm.ads203.Open;
    end



  else
  messagedlg('审批不成功，当前审批人不是您！',mterror,[mbcancel],0);


     with dm.tmp do
     begin
      Close;
      SQL.Clear;
      SQL.Text:='select SUPLFEDSHIP,SUPLFEDMAT,SUPLFEDMISC from data0192';
      Open;
     end;
     if Trim(dm.tmp.FieldByName('SUPLFEDSHIP').AsString) <> '' then
     begin
      with dm.tmp1 do
      begin
        Close;
        SQL.Text:='insert ['+dm.tmp.FieldValues['SUPLFEDSHIP']+'].'+dm.tmp.FieldValues['SUPLFEDMAT']+'.dbo.'+dm.tmp.FieldValues['SUPLFEDMISC']+
                  '(phonenumber,messagecontent,sendername,companyid) '+
                  'values (:phonenumber,:messagecontent,:sendername,9)';
          Parameters[0].Value:=tel;
          Parameters[1].Value:='有返工申请需要您审核';
          Parameters[2].Value:=name1;
          ExecSQL;
       //   ShowMessage('手机短信已发出');
      end;
     end;

end;

  {
procedure Tfrm_main.N2Click(Sender: TObject);
begin
//如果已全部审批无法取消
try
  dm.ADOConnection1.BeginTrans;
  dm.ads203.Edit; 
  dm.ads203auth_date.AsVariant := null;   // 取消审批
  dm.ads203auth_flag.Value:= true;
  dm.ADS203user_ptr260.AsVariant := null; //取消审批
  dm.ADS203puth_info.AsVariant := null ;

  if dm.ADS203status.Value = 2 then   dm.ADS203status.Value := 1;

  dm.ADS203.Post;  
   dm.ads260.Close;
   dm.ads260.Open;
   while not dm.ads260.Eof do
    begin
     if dm.ads260seq_no.Value-dm.ADS203seq_no.Value = 1 then
      begin               //给下一个审批用户赋否值,
       dm.ads260.Edit;
       dm.ads260auth_flag.Value:= false ;
       dm.ads260.Post;
       break;
      end;
     dm.ads260.Next;
    end;
    dm.ADOConnection1.CommitTrans;
 except
    dm.ADOConnection1.RollbackTrans;
    messagedlg('取消审批操作不成，请退出后再来一次',mtinformation,[mbok],0);
    dm.ADS203.Close;
    dm.ADS203.Open;
 end;
end;
          }
procedure Tfrm_main.N3Click(Sender: TObject);
var     str:string;
begin
if (strtoint(vprev) = 1) or (strtoint(vprev) = 3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限', mtinformation, [mbok], 0);
    abort;
  end;

if messagedlg('退回操作是不可逆操作,你确定吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
begin
 str := InputBox('退回原因','','');
 if trim(str)<>'' then
 begin
 dm.ads203.Edit;
 dm.ADS203status.Value:=3;
 dm.ADS203auth_date.Value := getsystem_date(dm.adoquery1,0);//退回日期
 dm.ADS203user_ptr260.Value:=strtoint(user_ptr);
 dm.ADS203puth_info.Value:=str;
 dm.ADS203.Post;
 dm.ADS203.Close;
 dm.ADS203.Open;
 end
 else
 messagedlg('退回原因为空，退回操作不成',mtinformation,[mbok],0);
end;
end;

procedure Tfrm_main.N5Click(Sender: TObject);
begin
  try
    frm_detail := Tfrm_detail.Create(Application);
    dm.ads252.Close;
    DM.ads239.Close;
    dm.ads252.Parameters[0].Value := dm.ADS203rkey203.Value;
    dm.ads239.Parameters[0].Value := dm.ADS203rkey203.Value;
    with  frm_detail do
    begin
      dm.ads252.open;
      DM.ads239.open;
      dbgrd1.ReadOnly := True;
      dbgrd2.ReadOnly := True;
      ShowModal;
      dm.ads252.Close;
      dm.ads239.Close;
    end;

    finally
    frm_detail.Free;
    end;
   { form2:=tform2.Create(application);
    dm.ADSA85.Close;
    dm.ADSa85.Parameters[0].Value:=dm.ADS85rkey.Value;
    dm.ADSa85.Open;
    with form2 do
    begin
      bitbtn1.Enabled:=false;
      dbedit1.ReadOnly:=true;
      dbedit2.Enabled:=false;
      dbedit3.Enabled:=false;
      dbedit4.Enabled:=false;
      dbedit5.Enabled:=false;
      dbedit6.Enabled:=false;
      dbedit7.Enabled:=false;
      dbedit8.Enabled:=false;
      dbedit9.Enabled:=false;
      dbedit10.Enabled:=false;
      dbedit11.Enabled:=false;
      dbedit12.Enabled:=false;
      dbedit13.Enabled:=false;
      dbedit15.Enabled:=false;
      dbedit16.Enabled:=false;
      dbedit31.Enabled:=false;
      dbedit32.Enabled:=false;
      dbmemo1.Enabled:=false;
      dbradiogroup1.Enabled:=false;
      edit1.Enabled:=false;
      edit2.Enabled:=false;
      edit3.Enabled:=false;
      edit4.Enabled:=false;
      edit5.Enabled:=false;
      combobox3.Enabled:=false;
      bitbtn3.Enabled:=false;
      bitbtn4.Enabled:=false;
      bitbtn5.Enabled:=false;
      bitbtn7.Enabled:=false;
      bitbtn8.Enabled:=false;
      button1.Enabled:=false;
      speedbutton1.Enabled:=false;
      speedbutton2.Enabled:=false;
      dbmemo2.Enabled:=false;
      stringgrid1.Enabled:=false;
    end;

    form2.ShowModal;
    dm.ADSA85.Close;
    DM.ads432.Close;
    dm.ads431.Close;
    dm.ads511.Close;
    dm.ads278.Close;
  finally
    form2.Free;
  end;}
end;

procedure Tfrm_main.N6Click(Sender: TObject);
begin
 application.CreateForm(tform_authinfo,form_authinfo);
 dm.ads260.Open;
 Form_authinfo.ShowModal;
 dm.ads260.Close;
 form_authinfo.Free;
end;

procedure Tfrm_main.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
 if (dm.ADS203auth_date.AsVariant=null) then
  DBGrid1.Canvas.Font.Color := cllime
 else
  if (dm.ADS203STATUS.Value=3) then
   DBGrid1.Canvas.Font.Color := clred;
 DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure Tfrm_main.btn1Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure Tfrm_main.PopupMenu1Popup(Sender: TObject);
begin
  n1.Enabled:=false;
  n3.Enabled:=false;
  //n2.Enabled:=false;
  n5.Enabled:=false;
  n6.Enabled:=false;
  
if dm.ADS203.IsEmpty then
 begin
  n1.Enabled:=false;
  n3.Enabled:=false;
  //n2.Enabled:=false;
  n5.Enabled:=false;
  n6.Enabled:=false;

 end
else
begin
  n5.Enabled:=true;
  n6.Enabled:=true;

if (dm.ADS203auth_flag.AsVariant = true) then
 begin
  n1.Enabled:=true;
  //n2.Enabled:=false;
  n3.Enabled:=true;
 end
else
 begin
  //showmessage(formatdatetime('yyyy-MM-dd',dm.ADS203auth_date.AsDateTime));
  n1.Enabled:=false;
  //n2.Enabled:=true;
  n3.Enabled:=false;
 end;
end;
end;

procedure Tfrm_main.btn2Click(Sender: TObject);
begin
 DM.ADS203.Close;
 DM.ADS203.Open;
end;

end.

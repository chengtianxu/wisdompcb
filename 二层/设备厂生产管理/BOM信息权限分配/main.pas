unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, ComCtrls, Grids, DBGridEh, StdCtrls, ExtCtrls,
  Buttons, ToolWin;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    ToolBar1: TToolBar;
    ToolButton5: TToolButton;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton2: TToolButton;
    ToolButton7: TToolButton;
    ToolButton3: TToolButton;
    ToolButton8: TToolButton;
    ToolButton4: TToolButton;
    ToolButton9: TToolButton;
    Panel3: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    RadioGroup1: TRadioGroup;
    Eh1: TDBGridEh;
    Bar1: TStatusBar;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure Eh1TitleClick(Column: TColumnEh);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    sql_text,sql_text1:string;
    rkey:integer;
    precolumn:Tcolumneh;
    procedure get_detail(ttype,value:integer);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses damo,common,ConstVar,Pick_Item_Single,pickitem;

{$R *.dfm}

  //
procedure TForm1.get_detail(ttype,value:integer);
begin 
  with dm.ADS100 do
  begin
    close;
    if ttype=0 then
      begin
        commandtext:=sql_text+' where w100.csi_ptr='+inttostr(value);
      end
    else begin
      commandtext:=sql_text+' where w100.proc_ptr='+inttostr(value);
    end;
     Open;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    if not App_Init(dm.ADOConnection1) then
      begin
         showmsg('程序启动失败，请与系统管理员联系！','提示',1);
         application.Terminate;
      end;
end;


procedure TForm1.ToolButton1Click(Sender: TObject);
begin
    Application.Terminate;
end;

procedure TForm1.ToolButton2Click(Sender: TObject);
begin
    if Trim(Edit1.Text) <> '' then
      N1.Click
    else
      ShowMessage('请先确定需要分配权限的'+copy(label1.Caption,1,8)+'！');
end;

procedure TForm1.ToolButton3Click(Sender: TObject);
begin
    if not dm.ADS100.IsEmpty then
      N2.Click;

end;

procedure TForm1.ToolButton4Click(Sender: TObject);
begin
     if Trim(Edit1.Text) <> '' then
       begin
         dm.ADS100.Close;
         dm.ADS100.Open;
       end;

end;


procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
    edit1.Text := '';
    Label2.Caption := '';
    dm.ADS100.Close;
    if RadioGroup1.ItemIndex =0 then
     begin
       Label1.Caption := '用户代码：' ;
       Eh1.Columns[0].FieldName := 'PROD_CODE';
       Eh1.Columns[1].FieldName := 'PRODUCT_NAME';
       Eh1.Columns[0].Title.Caption :='产品编码';
       Eh1.Columns[1].Title.Caption :='产品名称';
       Bar1.Panels[2].Text := '系统有效产品：' ;
       dm.AQTMP.Close;
       dm.AQTMP.SQL.Text := 'select count(rkey) from data0008 where if_control<>0 ';
       dm.AQTMP.Open;
       Bar1.Panels[3].Text := dm.AQTMP.Fields[0].AsString;
     end
    else begin
     Label1.Caption :='产品编码：';
     Eh1.Columns[0].FieldName :='user_login_name';
     Eh1.Columns[1].FieldName:='user_full_name';
     Eh1.Columns[0].Title.caption:='用户代码';
     Eh1.Columns[1].Title.caption:='用户名称';
     Bar1.Panels[2].Text:='';
     Bar1.Panels[3].Text:='';
    end;

end;


procedure TForm1.Edit1Click(Sender: TObject);
begin
    Edit1.SelectAll;
end;


procedure TForm1.Edit1Exit(Sender: TObject);
begin
   if (Trim(Edit1.Text) <> '') then
     with dm.AQTMP do
     if RadioGroup1.ItemIndex =0 then
       begin
         SQL.Text := 'select rkey,user_full_name from data0073 where active_flag=0 and '+
           'user_group_flag=1 and user_login_name='''+trim(edit1.Text)+'''';
         Open;
         if IsEmpty then
           begin
             showmessage('输入的用户代码不存在，请重新输入或选择！');
             Edit1.Text := '';
             Label2.Caption := '';
             Edit1.SetFocus;
             dm.ADS100.Close;
           end
         else begin
           Label2.Caption := FieldValues['user_full_name'];
           rkey := fieldvalues['rkey'];
           get_detail(0,rkey);
         end;
       end
     else begin
       SQL.Text := 'select rkey,PRODUCT_NAME from data0008 where if_control<>0 and '+'PROD_CODE='''+trim(Edit1.Text)+'''';
       Open;
       if IsEmpty then
         begin
           showmessage('输入的产品代码不存在，请重新输入或选择！');
           Edit1.Text:='';
           Label2.Caption:='';
           Edit1.SetFocus;
           dm.ADS100.Close;
         end
       else begin
         Label2.Caption := FieldValues['PRODUCT_NAME'];
         rkey:=fieldvalues['rkey'];
         get_detail(1,rkey);
       end;
     end
   else begin
       Label2.Caption := '';
       dm.ADS100.Close;
   end;
     dm.AQTMP.Close;

end;


procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
      Eh1.SetFocus;
end;


procedure TForm1.BitBtn2Click(Sender: TObject);
var inputvar:PDlgInput;
begin
     frmpick_item_single:=Tfrmpick_item_single.Create(application);
  try
    if RadioGroup1.ItemIndex=0 then
    begin
      inputvar.Fields:='user_login_name/用户代码/130,user_full_name/用户名称/240';
      inputvar.Sqlstr:='select rkey,user_login_name,user_full_name from data0073 '+
        'where active_flag=0 and user_group_flag=1 order by user_login_name';
      inputvar.KeyField:='user_login_name';
    end
    else begin
      inputvar.Fields:='PROD_CODE/产品编码/130,PRODUCT_NAME/产品名称/240';
      inputvar.Sqlstr:='select rkey,PROD_CODE,PRODUCT_NAME from data0008 '+
        'where if_control<>0 order by PROD_CODE';
      inputvar.KeyField:='PROD_CODE';
    end;
    inputvar.InPut_value:=edit1.Text;
    inputvar.AdoConn:=dm.ADOConnection1;
    frmpick_item_single.InitForm_New(inputvar);
    if frmpick_item_single.ShowModal=mrok then
      if RadioGroup1.ItemIndex=0 then
      begin
        edit1.Text:=trim(frmpick_item_single.adsPick.FieldValues['user_login_name']);
        label2.Caption:=frmpick_item_single.adsPick.FieldValues['user_full_name'];
        rkey:=frmpick_item_single.adsPick.FieldValues['rkey'];
        get_detail(0,rkey);
      end
      else begin
        edit1.Text:=trim(frmpick_item_single.adsPick.FieldValues['PROD_CODE']);
        label2.Caption:=frmpick_item_single.adsPick.FieldValues['PRODUCT_NAME'];
        rkey:=frmpick_item_single.adsPick.FieldValues['rkey'];
        get_detail(1,rkey);
      end
    else edit1.SetFocus;
  finally
    frmpick_item_single.adsPick.Close;
    frmpick_item_single.Free;
  end;
end;


procedure TForm1.Eh1TitleClick(Column: TColumnEh);
begin
      if column.Title.SortMarker=smupeh then
        begin
          column.Title.SortMarker:=smdowneh;
          dm.ads100.IndexFieldNames:=column.FieldName+' DESC';
        end
      else begin
        column.Title.SortMarker:=smupeh;
        dm.ADS100.IndexFieldNames:=column.FieldName;
      end;

      if (column.ReadOnly) and (precolumn.FieldName<>column.FieldName) then
      begin //先把非字符型的column的readonly属性设为false,非字符型不能用edit搜索
        precolumn.Title.Color:=clbtnface;
        column.Title.Color:=clred;
        precolumn:=column;
      end;
end;


procedure TForm1.N1Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
   showmessage('对不起，您只有该程序的只读权限！')
  else
  try
    frm_pickitem := Tfrm_pickitem.Create(Application);
    with dm.ADS_pickitem do
    if RadioGroup1.ItemIndex=0 then
    begin
     dm.AQ100.SQL.Text:=sql_text1+' where csi_ptr='+inttostr(rkey);
     frm_pickitem.Label1.Caption:='搜索（产品编码）：';
     fields[2].FieldName:='PROD_CODE';
     fields[3].FieldName:='PRODUCT_NAME';
     frm_pickitem.Eh1.Columns[1].FieldName:='PROD_CODE';
     frm_pickitem.Eh1.Columns[1].Title.caption:='产品编码';
     frm_pickitem.Eh1.Columns[2].FieldName:='PRODUCT_NAME';
     frm_pickitem.Eh1.Columns[2].Title.caption:='产品名称';
     commandtext:='declare @isselected bit select @isselected=0 '+#13+
       'select @isselected as isselected,rkey,upper(PROD_CODE) as PROD_CODE,'+
       'upper(PRODUCT_NAME)+'' '' as PRODUCT_NAME '+
       'from data0008 where if_control<>0 order by PROD_CODE ';
    end
    else begin
     dm.AQ100.SQL.Text:=sql_text1+' where proc_ptr='+inttostr(rkey);
     frm_pickitem.Label1.Caption:='搜索（用户代码）：';
     fields[2].FieldName:='user_login_name';
     fields[3].FieldName:='user_full_name';
     frm_pickitem.Eh1.Columns[1].FieldName:='user_login_name';
     frm_pickitem.Eh1.Columns[1].Title.caption:='用户代码';
     frm_pickitem.Eh1.Columns[2].FieldName:='user_full_name';
     frm_pickitem.Eh1.Columns[2].Title.caption:='用户名称';
     commandtext:='declare @isselected bit select @isselected=0 '+#13+
      'select @isselected as isselected,rkey,upper(user_login_name) as user_login_name,'+
      'upper(user_full_name)+'' '' as user_full_name '+
      'from data0073 where active_flag=0 and user_group_flag=1 order by user_login_name ';
    end;
    dm.ADS_pickitem.Open;
    dm.AQ100.Open;
    dm.AQ100.Edit;
    if frm_pickitem.ShowModal=mrok then
    begin
   // dm.CDS_pickitem.Filter:='isselected = true';
   // dm.CDS_pickitem.Filtered:=True;
     dm.CDS_pickitem.First;
     if radiogroup1.ItemIndex=0 then  //按用户
      while not dm.CDS_pickitem.Eof do
      begin
       if dm.CDS_pickitem.FieldByName('isselected').AsBoolean then
        if not (dm.AQ100.Locate('proc_ptr',dm.CDS_pickitem.fieldbyname('rkey').AsInteger,[])) then
        begin
         dm.AQ100.Append;
         dm.AQ100.FieldByName('csi_ptr').Value:=rkey;
         dm.AQ100.FieldByName('proc_ptr').Value:=dm.CDS_pickitem.fieldbyname('rkey').AsInteger;
         dm.AQ100.Post;
        end;
       dm.CDS_pickitem.Next;
      end
     else while not dm.CDS_pickitem.Eof do  //按产品
     begin
      if dm.CDS_pickitem.FieldByName('isselected').AsBoolean then
       if not (dm.AQ100.Locate('csi_ptr',dm.CDS_pickitem.fieldbyname('rkey').AsInteger,[])) then
       begin
        dm.AQ100.Append;
        dm.AQ100.FieldByName('proc_ptr').Value:=rkey;
        dm.AQ100.FieldByName('csi_ptr').Value:=dm.CDS_pickitem.fieldbyname('rkey').AsInteger;
        dm.AQ100.Post;
       end;
      dm.CDS_pickitem.Next;
     end;
    dm.ADS100.Close;
    dm.ADS100.Open;
    end;
  finally
     dm.ADS_pickitem.Close;
     dm.AQ100.Close;
     frm_pickitem.Free;
  end;
end;


procedure TForm1.N2Click(Sender: TObject);
begin
    if (StrToInt(vprev)=0) or (StrToInt(vprev)=3) then
      showmessage('对不起，您只有该程序的只读权限！')
    else
      if messagedlg('你确定删除这条记录吗？',mtwarning,[mbyes,mbno],0)=mryes then
       with dm.AQTMP do
        begin
          SQL.Text:='delete wzcp0100 where csi_ptr=:p1 and proc_ptr=:p2 ';
          Parameters.ParamByName('p1').Value:=dm.ADS100.FieldValues['csi_ptr'];
          Parameters.ParamByName('p2').Value:=dm.ADS100.fieldvalues['proc_ptr'];
          ExecSQL;
          dm.ADS100.Close;
          dm.ADS100.Open;
        end;
end;


procedure TForm1.N3Click(Sender: TObject);
begin
    if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
      showmessage('对不起，您只有该程序的只读权限！')
    else 
    if messagedlg('你确定删除所有记录吗？',mtwarning,[mbyes,mbno],0)=mryes then
    with dm.AQTMP do
    begin
      dm.ADS100.First;
      SQL.Text:='delete wzcp0100 where csi_ptr=:p1 and proc_ptr=:p2 ';
      while not dm.ADS100.eof do
      begin
        Parameters.ParamByName('p1').Value:=dm.ADS100.fieldvalues['csi_ptr'];
        Parameters.ParamByName('p2').Value:=dm.ADS100.fieldvalues['proc_ptr'];
        ExecSQL;
        dm.ADS100.Next;
      end;
      dm.ADS100.Close;
      dm.ADS100.Open;
    end;
end;


procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
     N1.Enabled:=trim(Edit1.Text)<>'';
     N2.Enabled:=not dm.ADS100.IsEmpty;
     N3.Enabled:=not dm.ADS100.IsEmpty;
end;


procedure TForm1.FormShow(Sender: TObject);
begin
  sql_text:=copy(dm.ADS100.CommandText,1,pos('where',dm.ADS100.CommandText)-1);
  sql_text1:=dm.aq100.sql.text;
  precolumn:=eh1.Columns[0];
  radiogroup1.OnClick(sender);
   
end;




end.

unit rpt_model_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, Buttons, Menus,AppEvnts;

type
    Tfrm_rpt_model = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    RadioGroup3: TRadioGroup;
    RadioGroup4: TRadioGroup;
    RadioGroup5: TRadioGroup;
    RadioGroup6: TRadioGroup;
    DBGrid2: TDBGrid;
    Edit1: TEdit;
    Label1: TLabel;
    BitBtn5: TBitBtn;
    Edit2: TEdit;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    BitBtn4: TBitBtn;
    BitBtn3: TBitBtn;
    PopupMenu1: TPopupMenu;
    Label_account: TLabel;
    ComboBox1: TComboBox;
    RG_modletype: TRadioGroup;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    BitBtn6: TBitBtn;
    ApplicationEvents1: TApplicationEvents;
    Label3: TLabel;
    BitBtn7: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure RG_modletypeClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure BitBtn7Click(Sender: TObject);
  private
     procedure item_click(sender:TObject);
     procedure item_refresh;
     procedure radiogroup_refresh;
  public
      {}
  end;
var
  frm_rpt_model: Tfrm_rpt_model;
implementation
uses common,damo;
{$R *.dfm}

procedure Tfrm_rpt_model.item_click(sender: TObject);
begin
  Edit2.Text := (sender as tmenuItem).Caption;
end;


procedure Tfrm_rpt_model.item_refresh ;
var
  i:integer;
  item:TMenuItem;
begin
  if combobox1.Text <> '' then
  begin
    PopupMenu1.Items.Clear;
    i:=integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex]);
    dm.ADOTMP.SQL.Clear;
    if rg_modletype.ItemIndex=0 then
    dm.ADOTMP.SQL.Text :=
    ' select datafield,itemname from  dbo.DesignSalaryItem '+
    ' where accountid='+inttostr(i)+
    ' order by itemindex '
    else
       dm.ADOTMP.SQL.Text :=
    ' select datafield,itemname from  dbo.DesignSalaryItem '+
    ' where accountid='+inttostr(i)+ ' and datasourcetype=0 '+
    //0是数值，1是公式，2是固定值
    ' order by itemindex ' ;
    dm.ADOTMP.Open;

    for i:=0 to dm.ADOTMP.RecordCount-1 do
      begin
       item := TmenuItem.Create(self) ;
       item.Caption := dm.ADOTMP.FieldByName('itemname').asString;
       item.OnClick := item_click ;
       PopupMenu1.Items.Add(item) ;
       dm.ADOTMP.Next;
      end;
  end
  else
   begin
    showmessage('请选择帐套');
    abort;
   end;
end;

 procedure Tfrm_rpt_model.radiogroup_refresh ;
 var i,j,rkey: integer;
begin
  combobox1.Clear;
  dm.ADOTMP.SQL.Clear;
  dm.ADOTMP.SQL.Text :='select * from salaryaccount';
  dm.ADOTMP.Open;
  if dm.ADOTMP.RecordCount>0 then radiogroup1.Visible := true;
  if dm.ADOTMP.RecordCount>0 then radiogroup4.Visible := true;
  if dm.ADOTMP.RecordCount>1 then radiogroup2.Visible := true;
  if dm.ADOTMP.RecordCount>1 then radiogroup5.Visible := true;
  if dm.ADOTMP.RecordCount>2 then radiogroup3.Visible := true;
  if dm.ADOTMP.RecordCount>2 then radiogroup6.Visible := true;
  for i:=0 to dm.ADOTMP.RecordCount-1 do
    begin
     rkey :=  strtoint(dm.ADOTMP.FieldByName('rkey').asstring);
     combobox1.Items.AddObject(dm.ADOTMP.FieldByName('accountname').asString,Tobject(rkey));
     if i=0 then
     begin
         radiogroup1.Items.Clear;
         radiogroup1.Items.Add('无');
         radiogroup4.Items.Clear;
         radiogroup4.Items.Add('无');
         radiogroup1.Tag := rkey;
         radiogroup1.Caption := dm.ADOTMP.FieldByName('accountname').asString+'展示';
         radiogroup4.Tag := rkey;
         radiogroup4.Caption := dm.ADOTMP.FieldByName('accountname').asString+'导入';
         dm.ADOTMP2.SQL.Clear;
         dm.ADOTMP2.SQL.Text :=' select distinct model_name,[type] from '+
                               ' employeesalary_rpt_model '+
                               ' where accountid='+inttostr(rkey);
        dm.ADOTMP2.Open;
        for j:=0 to dm.ADOTMP2.RecordCount-1 do
        begin
          if dm.ADOTMP2.FieldByName('type').AsInteger=0 then
            radiogroup1.Items.Add(dm.ADOTMP2.FieldByName('model_name').AsString)
          else
            radiogroup4.Items.Add(dm.ADOTMP2.FieldByName('model_name').AsString) ;
          dm.ADOTMP2.Next;
        end;
        dm.ADOTMP2.Close;

     end;
     if i=1 then
     begin
         radiogroup2.Items.Clear;
         radiogroup2.Items.Add('无');
         radiogroup5.Items.Clear;
         radiogroup5.Items.Add('无');
         radiogroup2.Tag := rkey;
         radiogroup2.Caption := dm.ADOTMP.FieldByName('accountname').asString+'展示';
         radiogroup5.Tag := rkey;
         radiogroup5.Caption := dm.ADOTMP.FieldByName('accountname').asString+'导入';
         dm.ADOTMP2.SQL.Clear;
         dm.ADOTMP2.SQL.Text :=' select distinct model_name,[type] from '+
                               ' employeesalary_rpt_model '+
                               ' where accountid='+inttostr(rkey);
        dm.ADOTMP2.Open;
        for j:=0 to dm.ADOTMP2.RecordCount-1 do
        begin
          if dm.ADOTMP2.FieldByName('type').AsInteger=0 then
            radiogroup2.Items.Add(dm.ADOTMP2.FieldByName('model_name').AsString)
          else
            radiogroup5.Items.Add(dm.ADOTMP2.FieldByName('model_name').AsString) ;
          dm.ADOTMP2.Next;
        end;
        dm.ADOTMP2.Close;
     end;
     if i=2 then
     begin
         radiogroup3.Items.Clear;
         radiogroup3.Items.Add('无');
         radiogroup6.Items.Clear;
         radiogroup6.Items.Add('无');
         radiogroup3.Tag := rkey;
         radiogroup3.Caption := dm.ADOTMP.FieldByName('accountname').asString+'展示';
         radiogroup6.Tag := rkey;
         radiogroup6.Caption := dm.ADOTMP.FieldByName('accountname').asString+'导入';
                dm.ADOTMP2.SQL.Clear;
         dm.ADOTMP2.SQL.Text :=' select distinct model_name,[type] from '+
                               ' employeesalary_rpt_model '+
                               ' where accountid='+inttostr(rkey);
        dm.ADOTMP2.Open;
        for j:=0 to dm.ADOTMP2.RecordCount-1 do
        begin
          if dm.ADOTMP2.FieldByName('type').AsInteger=0 then
            radiogroup3.Items.Add(dm.ADOTMP2.FieldByName('model_name').AsString)
          else
            radiogroup6.Items.Add(dm.ADOTMP2.FieldByName('model_name').AsString) ;
          dm.ADOTMP2.Next;
        end;
        dm.ADOTMP2.Close;
     end;
     dm.ADOTMP.Next;
    end;
  dm.ADOTMP.Close;
  radiogroup1.ItemIndex :=0 ;
  radiogroup2.ItemIndex :=0 ;
  radiogroup3.ItemIndex :=0 ;
  radiogroup4.ItemIndex :=0 ;
  radiogroup5.ItemIndex :=0 ;
  radiogroup6.ItemIndex :=0 ; 
  combobox1.Text := '';
  try
  dm.qryModel.Open;
  except
    showmessage('模板加载失败');
  end;
end;

procedure Tfrm_rpt_model.FormCreate(Sender: TObject);
 begin
  radiogroup_refresh;
 end;

procedure Tfrm_rpt_model.BitBtn5Click(Sender: TObject);
begin
 PopupMenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure Tfrm_rpt_model.ComboBox1Change(Sender: TObject);
begin
item_refresh ;
end;

procedure Tfrm_rpt_model.RG_modletypeClick(Sender: TObject);
begin
item_refresh ;
end;

procedure Tfrm_rpt_model.BitBtn1Click(Sender: TObject);
begin
  if Trim(Edit2.Text) = '' then
  begin
    ShowMessage('添加的显示项目名称为空，请输入后再按+按钮！');
    Exit;
  end;
  with   dbgrid1.Columns.Add   do
  begin
    Title.Caption := Trim(Edit2.Text);
    Visible := True;
    Width := 100;
  end;
  Edit2.clear;
  if  rg_modletype.Enabled = true then rg_modletype.Enabled := false;
  if  combobox1.Enabled = true then combobox1.Enabled := false;

  
end;

procedure Tfrm_rpt_model.BitBtn4Click(Sender: TObject);
begin
  if  rg_modletype.Enabled = false then rg_modletype.Enabled := true ;
  if  combobox1.Enabled = false then combobox1.Enabled := true;
  dbgrid1.Columns.Clear;
end;

procedure Tfrm_rpt_model.BitBtn2Click(Sender: TObject);
begin
  dbgrid1.Columns.Delete(DBGrid1.Columns.Count - 1);
end;

procedure Tfrm_rpt_model.BitBtn3Click(Sender: TObject);
var
  i: Integer;
begin

  if ((strtoint(vprev)=1)or(strtoint(vprev)=3)) then
  begin
    showmessage('没有操作权限');
    exit;
  end;  
  if Trim(Edit1.Text) = '' then
  begin
    ShowMessage('请输入模版名称！');
    Exit;
  end;
  if trim(edit1.Text) <>'' then
  begin
    dm.ADOTMP.SQL.Clear;
    dm.ADOTMP.SQL.Text := 'select * from employeesalary_rpt_model where model_name='
                        + quotedStr(Edit1.Text) ;
    dm.ADOTMP.Open;
    if dm.ADOTMP.RecordCount>0   then
      begin
       dm.ADOTMP.Close;
       showmessage('模板名称不能重复');
       abort;
      end;
    dm.ADOTMP.Close;
  end;
  if DBGrid1.Columns[0].Title.Caption = '' then
  begin
    ShowMessage('没有添加显示项目名称！');
    Exit;
  end;
  for i := 0 to DBGrid1.Columns.Count - 1 do
  begin
    with dm.ADOTMP do
    begin
      SQL.Clear;
      SQL.Text := 'insert into employeesalary_rpt_model    '+
       ' values ('+ quotedStr(Edit1.Text)+','
       + QuotedStr(DBGrid1.Columns[i].Title.Caption)+','
       + #39+'F'+#39+','
       +IntToStr(i) +','
       +inttostr(integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex]))+','
       +inttostr(rg_modletype.ItemIndex)
       +' )';
      ExecSQL;
      close;
      sql.Clear;
      sql.Text := ' update   employeesalary_rpt_model   '+
       ' set datafield_f=b.datafield from '+
       ' employeesalary_rpt_model a join DesignSalaryItem b '+
       ' on a.datafield_name=b.itemname and a.accountid=b.accountid '+
       ' where a.datafield_f= '+#39+'F'+#39 ;
      execsql;
      close;
    end;
  end;
  Edit1.Clear;
  dm.qryModel.Close;
  dm.qryModel.Open;
  radiogroup_refresh;
end;


procedure Tfrm_rpt_model.N1Click(Sender: TObject);
begin
  if dm.qryModel.RecordCount < 0 then
  begin
    ShowMessage('当前是没有记录的，不能删除！');
    Exit;
  end;
  if MessageBox(Handle,'确定删除此记录吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
  with dm.ADOTMP do
  begin
    SQL.Clear;
    SQL.Text := 'delete from employeesalary_rpt_model where model_name=' +quotedstr(dm.qryModel.FieldValues['model_name']);
    ExecSQL;
  end;
  DM.qryModel.Close;
  DM.qryModel.Open;
  radiogroup_refresh;
end;

procedure Tfrm_rpt_model.BitBtn6Click(Sender: TObject);
begin
frm_rpt_model.Hide;
end;
procedure Tfrm_rpt_model.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
 if   (dbgrid2.Focused)   And   (Msg.message   =   WM_MOUSEWHEEL)   then
 begin
          if   Msg.wParam   >   0   then
               SendMessage(dbgrid2.Handle,   WM_KEYDOWN,   VK_UP,   0)
             else
                 SendMessage(dbgrid2.Handle,   WM_KEYDOWN,   VK_DOWN,   0);
             Handled   :=   True;
 end;

end;

procedure Tfrm_rpt_model.BitBtn7Click(Sender: TObject);
begin
  radiogroup_refresh;
end;

end.

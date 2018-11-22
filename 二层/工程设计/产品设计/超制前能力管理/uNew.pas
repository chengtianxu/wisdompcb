unit uNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask,ConstVar, ComCtrls,common,
  Grids, DBGrids, Menus, dbcgrids,DB, DBGridEh;

type
  TFormNew = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label_submitdet: TLabel;
    Label_submitperson: TLabel;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label5: TLabel;
    Edit1: TEdit;
    Label71: TLabel;
    Label25: TLabel;
    Label6: TLabel;
    Edit4: TEdit;
    BitBtn3: TBitBtn;
    Label67: TLabel;
    Label9: TLabel;
    Edit17: TEdit;
    BitBtn14: TBitBtn;
    Label10: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    Label1: TLabel;
    Edit9: TEdit;
    Label8: TLabel;
    dt1: TDateTimePicker;
    Label15: TLabel;
    SpeedButton4: TSpeedButton;
    Label_742deptstr: TLabel;
    Label_741rkey: TLabel;
    TabSheet3: TTabSheet;
    Label7: TLabel;
    Edit2: TEdit;
    Label12: TLabel;
    Label11: TLabel;
    Edit3: TEdit;
    Label14: TLabel;
    DateTimePicker1: TDateTimePicker;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    Edit5: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Panel4: TPanel;
    DBCtrlGrid1: TDBCtrlGrid;
    Label18: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    DBEdit1: TDBEdit;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    PopupMenu1: TPopupMenu;
    Add: TMenuItem;
    Edit: TMenuItem;
    Delete: TMenuItem;
    Edit6: TEdit;
    RadioButton3: TRadioButton;
    RadioGroup1: TRadioGroup;
    Grd2: TDBGridEh;
    PopupMenu2: TPopupMenu;
    N15: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBText1: TDBText;
    dbtxt: TDBText;
    RadioGroup2: TRadioGroup;
    Edit7: TEdit;
    Memo1: TMemo;
    Label13: TLabel;
    DBGridEh1: TDBGridEh;
    Label22: TLabel;
    Memo2: TMemo;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure Edit9KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure update_04(v_seed:string);
    procedure SpeedButton4Click(Sender: TObject);
    procedure AddClick(Sender: TObject);
    procedure EditClick(Sender: TObject);
    procedure DeleteClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormNew: TFormNew;
  function Power(x, y : extended) : extended;

const
 TmpFileDir = 'c:\tmp\';


implementation
uses part_search, uDM,Pick_Item_Single,DEPT_Edit,DEPT_Add, DEPT_Main,PubFunc,ShellAPI;

{$R *.dfm}

procedure TFormNew.BitBtn3Click(Sender: TObject);
begin
 frmcustpart := tfrmcustpart.Create(application);
  with frmcustpart.ADOQuery1 do
  begin
    close;
    frmcustpart.ADOQuery1.SQL.Add(' and MANU_PART_NUMBER LIKE ''%'+Trim(edit4.Text)+'%'''); //and data0025.customer_ptr='+inttostr(dm.ADOQuery4.FieldValues['customer_ptr'])+' ORDER BY MANU_PART_NUMBER');
    open;
  end;
  frmcustpart.Edit1.Text:=trim(edit4.Text);
 if frmcustpart.ADOQuery1.IsEmpty then
  begin
   messagedlg('请输入正确的产品型号!',mtinformation,[mbok],0);
   edit4.SetFocus;
  end
  else
 if frmcustpart.ShowModal=mrok then
  if frmcustpart.ADOQuery1.FieldByName('onhold_sales_flag').AsString='1' then
    messagedlg('此产品型号已暂缓销售!',mtwarning,[mbcancel],0)
  else
   with dm.ADOQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select ORIG_CUSTOMER from data0025 where MANU_PART_NUMBER='''+edit4.Text+'''');
      open;
    end;
   edit4.Text := trim(frmcustpart.ADOQuery1.fieldvalues['manu_part_number']);
   label71.Caption:=edit4.Text;
   edit4.Font.Color := clwindowtext;
   Edit17.Text:= dm.ADOQuery1.FieldByName('ORIG_CUSTOMER').AsString;
   Label67.Visible:=True;
   label67.Caption := frmcustpart.ADOQuery1.fieldbyname('manu_part_desc').AsString;
   label25.Caption:=frmcustpart.ADOQuery1.fieldbyname('rkey25').AsString;
   Edit2.Text:=Edit4.Text;
   edit2.Font.Color := clwindowtext;
   //dm.ADOFaTest.Parameters.ParamByName('MANU_PART_NUMBER').Value:=Edit4.Text;
   Edit3.Text:=Edit17.Text;


   with dm.ADOTMP1 do
  begin
  close;
  sql.Clear;
  SQL.Text:='select top 1 Rkey=Rkey+1  from FA0738 order by Rkey desc';
  open;
  end;

  dm.ADOFaTest.Close;
  dm.ADOFaTest.Parameters.ParamByName('MANU_PART_NUMBER').Value:=Edit4.Text;
  dm.ADOFaTest.Parameters.ParamByName('RKEY738').Value:=dm.ADOTMP1.FieldValues['Rkey'];
  dm.ADOFaTest.Open;

end;

procedure TFormNew.BitBtn14Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
    frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'RKEY/序号/100,CUST_CODE/客户代码/100,CUSTOMER_NAME/客户名称/277,ABBR_NAME/客户简称/100';
    InputVar.Sqlstr := 'select RKEY,CUST_CODE,CUSTOMER_NAME,ABBR_NAME from Data0010 where CUSTOMER_TYPE<>4';
    InputVar.AdoConn := DM.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Edit17.Text := frmPick_Item_Single.adsPick.FieldValues['ABBR_NAME'];
      Edit3.Text:=Edit17.Text;
      Label10.Caption := frmPick_Item_Single.adsPick.FieldValues['RKEY'];
      Edit17.Font.Color:=clwindowtext;
      Edit3.Font.Color:=clwindowtext;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TFormNew.Edit9KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#8,#13]) then abort;
end;

procedure TFormNew.SpeedButton2Click(Sender: TObject);
begin
close;
end;

procedure TFormNew.SpeedButton1Click(Sender: TObject);
begin
try
 if  Edit4.Text='' then
  begin
    showmessage('请输入本厂编号...');
    Edit4.SetFocus;
    exit;
  end;

   if  Edit9.Text='' then
  begin
    showmessage('请输入数量...');
    Edit4.SetFocus;
    exit;
  end;


 dm.ADOConnection1.BeginTrans;  //开始一个会话期间

  dm.ADO0738.Close;
  dm.ADO0738.Open;
  dm.ADO0738.Append;
  dm.ADO0738AUDITED_ptr.AsString:=user_ptr;
  dm.ADO0738FA_NUM.AsString:=Edit1.Text;
  dm.ADO0738RKEY25.Value:=StrToInt(Label25.caption);
  dm.ADO0738RKEY10.AsString:=Label10.caption;
  dm.ADO0738CreateDate.Value:=dt1.DateTime;
  dm.ADO0738Quality.Value:=strtoInt(Edit9.text);
  //dm.ADO0738BasicTechnology.AsString:=Memo2.text;
  //dm.ADO0738DifficultPoint.AsString:=Memo1.text;
  //dm.ADO0738BEIZHU.AsString:=Memo3.text;
  dm.ADO0738check_type.AsString:=Label_741rkey.Caption;  // 审批流程rkey
  dm.ADO0738circle.Value:=1;
  //dm.ADO0738.Value:=DBRadioGroup1.ItemIndex;
  dm.ADO0738FAStatus.Value:=RadioGroup1.ItemIndex;
  dm.ADO0738BasicTechnology.Value:=Memo2.Text;
  dm.ADO0738.Post;


//////////////////////////////////////////////////////////////////////////////////
  dm.ADO0740.Close;
  dm.ADO0740.Open;
  dm.ADO0740.Append;
  dm.ADO0740RKEY25.Value:=StrToInt(Label25.caption);
  dm.ADO0740RKEY10.AsString:=Label10.caption;
  dm.ADO0740RKEY738.Value:=dm.ADO0738Rkey.Value;
  dm.ADO0740TestDate.Value:=DateTimePicker1.DateTime;
  dm.ADO0740Create_ptr.AsString:=user_ptr;
  dm.ADO0740TStatus.Value:=RadioGroup2.ItemIndex;
  dm.ADO0740finished.Value:=Edit7.text;
  dm.ADO0740suggestion.Value:=Memo1.text;
  dm.ADO0740.Post;

//////////////////////////////////////////////////////////////////////////////////
  dm.UPdate740.Close;
  dm.UPdate740.Parameters.ParamByName('d738_ptr').Value:=dm.ADO0738Rkey.Value;
  dm.UPdate740.Parameters.ParamByName('d738_ptr2').Value:=dm.ADO0738Rkey.Value;
  dm.UPdate740.Open;


///////////////////////////////////////////////////////////////////////////////////

  showmessage('新增操作成功!');

  //dm.ADOTMP1.ExecSQL;
  dm.ADOD04.Close;
  dm.ADOD04.Open;
 if dm.ADOD04SEED_FLAG.Value<>1 then
 self.update_04(trim(dm.ADOD04SEED_VALUE.Value));


 dm.ADOConnection1.CommitTrans;
 except
 on e:exception do
 begin
  showmessage(e.Message);
  dm.ADOConnection1.RollbackTrans;
 end;
end;
 modalresult:=mrok;


end;

procedure TFormNew.PageControl1Change(Sender: TObject);
begin
 dm.ADOQuery4.Active:=False;

if (RadioGroup1.ItemIndex=-1) or (RadioGroup1.ItemIndex=0) then
TabSheet3.Visible:=False;

  //Label16.Visible:=False;
  //Edit5.Visible:=False;
  //Label17.Visible:=False;
  //RadioButton1.Visible:=False;
  //RadioButton2.Visible:=False;
  //RadioButton3.Visible:=False;
  RadioButton3.Checked:=True;


  with dm.ADOTMP1 do
  begin
  close;
  sql.Clear;
  SQL.Text:='select top 1 Rkey=Rkey+1  from FA0738 order by Rkey desc';
  open;
  end;
  Edit5.Text:=IntToStr(dm.ADOTMP1.FieldValues['Rkey']);


  dm.ADO0744.Close;
  dm.ADO0744.Parameters.ParamByName('rkey744').Value:=dm.ADO0738Rkey.Value;
  dm.ADO0744.Open;


 
  //dm.ADOQuery4.Active:=False;
end;

procedure TFormNew.FormShow(Sender: TObject);
begin
 RadioGroup1.ItemIndex:=0;

if (RadioGroup1.ItemIndex=-1) or (RadioGroup1.ItemIndex=0)  then
TabSheet3.Visible:=False;

DateTimePicker1.DateTime:=Now;
end;


procedure TFormNew.update_04(v_seed: string);
var
 i,v_length:integer;
 v_last,new_seed:string;
begin
 v_length := length(v_seed);
 for i := v_length downto 1 do
  if not (v_seed[i] in ['0'..'9']) then   //如果不是数字
   begin
    v_last := floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
    new_seed := copy(v_seed,1,i)+copy(v_last,i+1,v_length-i);
    dm.adod04.Edit; //使前缀不变后缀加1
    dm.adod04SEED_VALUE.Value := new_seed;
    dm.adod04.Post;
    break;
   end
  else
   if i=1 then //如果第一位仍然是数字
    begin
     v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
     new_seed := copy(v_last,2,v_length);
     dm.adod04.Edit;
     dm.adod04SEED_VALUE.Value := new_seed;
     dm.adod04.Post;
    end;
end;

function Power(x, y : extended) : extended;
begin
result := exp(y*ln(x));
end;


procedure TFormNew.SpeedButton4Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
  frmPick_Item_Single.Width :=800;
  frmPick_Item_Single.Height :=600;
  InputVar.Fields := 'type_code/审批代码/80,name/审批流程名称/100,dept_name/审批流程/650';
  InputVar.Sqlstr :=dm.Queryofbp.SQL.Text;
  InputVar.AdoConn := dm.ADOConnection1;
  frmPick_Item_Single.InitForm_New(InputVar) ;
  if frmPick_Item_Single.ShowModal=mrok then
  begin
      edit6.Text := frmPick_Item_Single.adsPick.FieldValues['name'];
      Label_741rkey.Caption:=frmPick_Item_Single.adsPick.FieldValues['d741_ptr'];
      Label_742deptstr.Caption :=frmPick_Item_Single.adsPick.FieldValues['dept_name'];



  end;
  finally
  frmPick_Item_Single.adsPick.Close;
  frmPick_Item_Single.Free ;
  end;
end;

procedure TFormNew.AddClick(Sender: TObject);
var
  bookmark: TBookMark;
begin
  dm.ADOQuery4.Active:=False;
 { Label16.Visible:=False;
  Edit5.Visible:=False;
  Label17.Visible:=False;
  RadioButton1.Visible:=False;
  RadioButton2.Visible:=False;
  RadioButton3.Visible:=False;
  RadioButton3.Checked:=True;
  Edit5.Text:=IntToStr(dm.ADOQuery4.FieldValues['Rkey']); }
  RadioButton3.Checked:=True;
  Edit5.Text:='';
  dm.ADOQuery4.Active:=True;


  with dm.ADOTMP2 do
  begin
  close;
  sql.Clear;
  SQL.Text:='select top 1 Rkey=Rkey+1  from FA0738 order by Rkey desc';
  open;
  end;



  if not dm.ADOQuery4.IsEmpty then
  begin
  Edit5.Text:=IntToStr(dm.ADOTMP2.FieldValues['Rkey']);
  end
  else
  begin
  Edit5.Text:='';
  end;

  //dm.ADOQuery4.Active:=False;



  dm.ADOTable1.Close;
  dm.ADOTable1.ReadOnly:=false;
  dm.ADOTable1.Open;
  Form3:=TForm3.Create(Application);
  Bookmark:=dm.AdoTable1.GetBookmark();

  with dm.ADOTMP1 do
  begin
  close;
  sql.Clear;
  SQL.Text:='select 1 from FA0738 where Rkey=1';
  open;
  end;

 // Form1.Hide;
  dm.AdoTable1.Append;
 // dm.AdoTable1.FieldValues['d738_ptr']:=dm.ADO0738Rkey.Value;
 if not  dm.ADOTMP1.IsEmpty then
 begin
 dm.AdoTable1.FieldValues['d738_ptr']:=dm.ADOTMP2.FieldValues['Rkey'];
 end
 else
 dm.AdoTable1.FieldValues['d738_ptr']:=1;
 dm.AdoTable1.FieldValues['DEPT_CODE']:='';
 dm.AdoTable1.FieldValues['BasicTechnology']:='';
 dm.AdoTable1.FieldValues['DifficultPoint']:='';
 dm.AdoTable1.FieldValues['BEIZHU']:='';
 if not  dm.ADOTMP1.IsEmpty then
 begin
 dm.AdoTable1.FieldValues['varchar_738']:=IntToStr(dm.ADOTMP2.FieldValues['Rkey']);
 end
 else
  dm.AdoTable1.FieldValues['varchar_738']:=IntToStr(1);
 if Form3.ShowModal<>mrok then
  dm.AdoTable1.GotoBookmark(bookmark);
  Form3.Free;
  dm.AdoTable1.FreeBookmark(bookmark);
  dm.ADOTable1.Close;
  dm.ADOTable1.ReadOnly:=true;
  dm.ADOTable1.Open;


end;

procedure TFormNew.EditClick(Sender: TObject);
begin
 if not dm.AdoTable1.IsEmpty then
  begin
  if dm.ADOQuery2.Active then
    dm.ADOQuery2.Close;
    dm.ADOQuery2.Parameters.ParamValues['DEPT_CODE'] := dm.ADOTable1DEPT_CODE.Value ;
    dm.ADOQuery2.Open;
    dm.ADOQuery2.Edit;
    FormNew.Hide;
    Form2:=TForm2.Create(Application);
    Form2.ShowModal;
    Form2.Free;
    dm.ADOTable1.Close;
    dm.ADOTable1.Open;
  end;
end;

procedure TFormNew.DeleteClick(Sender: TObject);
begin
 if dm.QRY1.Active then
 dm.QRY1.Close;
 dm.QRY1.Parameters.ParamValues['DEPT_CODE'] := dm.ADOTable1DEPT_CODE.Value ;
 if MessageDlg('你确定要删除这条记录吗？',mtConfirmation,[mbyes,mbno],0)=mryes then
 dm.QRY1.ExecSQL ;
 dm.ADOTable1.Close;
 dm.ADOTable1.Open;
end;

procedure TFormNew.FormActivate(Sender: TObject);
begin
dm.AdoTable1.Open;
dm.ADOQuery4.Open;

DateTimePicker1.Time:=Now;
//if not dm.ADO0740.IsEmpty then
//dm.AdoTable1.Filter:='d738_ptr like ''%'+(dm.ADOQuery4.fieldbyname('rkey').value)+'%'''

end;

procedure TFormNew.Edit5Change(Sender: TObject);
begin
 if RadioButton1.Checked=true then
 begin

  if trim(Edit5.Text)<>'' then
  begin
    dm.AdoTable1.Filter:='DEPT_CODE like ''%'+Trim(Edit5.Text)+'%'''
  end
 else
    dm.AdoTable1.Filter:='';
 end
 else
 if RadioButton2.Checked=true then
 begin
  if trim(Edit5.Text)<>'' then
    dm.AdoTable1.Filter:='BasicTechnology like ''%'+Trim(Edit5.Text)+'%'''
 else
    dm.AdoTable1.Filter:='';
 end;

  if RadioButton3.Checked=true then
 begin
  if trim(Edit5.Text)<>'' then
    dm.AdoTable1.Filter:='varchar_738 like ''%'+Trim(Edit5.Text)+'%'''
 else
    dm.AdoTable1.Filter:='';
 end;

end;

procedure TFormNew.RadioButton1Click(Sender: TObject);
begin
Label16.Caption:='工序代码';
end;

procedure TFormNew.RadioButton2Click(Sender: TObject);
begin
Label16.Caption:='基本工艺';
end;

procedure TFormNew.RadioButton3Click(Sender: TObject);
begin
Label16.Caption:='varchar_738';
end;

procedure TFormNew.N15Click(Sender: TObject);
var
  filename,f: string;
  fs: TMemoryStream;
begin
 dm.ADOTMP1.SQL.Clear;
 dm.ADOTMP1.SQL.Text:='select file_data from FA0744 where [file_name]='+quotedstr(dm.ADO0744file_name.AsString)+' and  contract_rkey='+inttostr(dm.ADO0738Rkey.Value);
 dm.adotmp1.Open;
 if dm.ADOTMP1.FieldByName('file_data').IsNull then
  begin
    showmessage('此文档为空');
    exit;
  end
 else
  begin
    fs:=TMemoryStream.Create;
    TBlobfield(dm.ADOTMP1.fieldbyname('file_data')).SaveToStream(fs);
    if not DirectoryExists(TmpFileDir) then
      if not CreateDir(TmpFileDir) then
        raise Exception.Create('创建临时文件目录错误: '+TmpFileDir);
    UnPackStream(fs);
    f:=TmpFileDir+dm.ADO0744file_name.AsString;
    fs.SaveToFile(f);
    fs.Free;
    dm.ADOTMP1.Close;
    dm.ADOTMP1.SQL.Clear;
    // setfileattributes(pchar(f),FILE_ATTRIBUTE_READONLY);
    ShellExecute(0,'open',pchar(f),nil,nil,SW_SHOWNORMAL);
  end;

end;

procedure TFormNew.N10Click(Sender: TObject);
var i:integer;
    y:integer;
    s:string;
    fs: TMemoryStream;
begin
 y:=dm.ADO0738Rkey.Value;
  OpenDialog1.DefaultExt :='*.*';
  OpenDialog1.Filter :='';
  if OpenDialog1.Execute then
  begin
    for i:=length(OpenDialog1.FileName) downto 1 do
    begin
      if OpenDialog1.FileName[i]<>'\' then
        s:=OpenDialog1.FileName[i]+s
      else
        break;
      end;
      fs := TMemoryStream.Create;
      fs.LoadFromFile(OpenDialog1.FileName);
      if fs.Size>10*1024*1024 then
      begin
        showmessage('文件大小不能超过10M,请重新整理文件再保存...');
        fs.Free;
        exit;
      end;
      PackStream(fs);
      if s <> '' then
      begin
        dm.ADOTMP1.Close;
        dm.ADOTMP1.SQL.Clear;
        dm.ADOTMP1.SQL.Text:='select [file_name] from FA0744 where [file_name]= '''+s+''' and contract_rkey='+inttostr(dm.ADO0738Rkey.Value);
        dm.ADOTMP1.Open;
        if not DM.ADOTMP1.IsEmpty then
          begin

            if Messagedlg('已经存在该文件名'+#13+'需要覆盖请点'+#39+'是'+#39,mtWarning,[mbYES,mbNO],0)=6  then
              begin
                dm.ADO0744.Locate('file_name',s,[]);
                dm.ADO0744.Edit;
                dm.ADO0744modify_person.Value:=StrToInt(user_ptr);
                dm.ADO0744modify_date.Value:=now();
                dm.ADO0744flag.Value:=3;
                try
                  dm.ADOTMP1.SQL.Clear;
                  dm.ADOTMP1.SQL.Add('update FA0744 '+
                    'set file_data=:file_data_s from FA0744 where [file_name]= '''+s+''' and contract_rkey='+inttostr(dm.ADO0738Rkey.Value) );
                  dm.ADOTMP1.Parameters.ParamByName('file_data_s').LoadFromStream(fs,ftBlob);
                  dm.ADOTMP1.ExecSQL;
                  dm.ADOTMP1.SQL.Clear;
                  dm.ADO0744.Post;
                  fs.Free;
                  showmessage('文件修改成功');
                  dm.ADO0744.Close;
                  if not dm.ADO0738.IsEmpty then dm.ADO0744.Open;
                except
                  dm.ADOTMP1.CanModify;
                  showmessage('文件上传失败');
                  fs.Free;
                end;
              end
            else
              begin
                showmessage('不覆盖文件，请重新选择新文件');
                abort;
              end;
          end
        else
          begin
            dm.ADO0744.Append;
            dm.ADO0744contract_rkey.Value:=dm.ADO0738Rkey.Value;
            dm.ADO0744submit_person.Value:=StrToInt(user_ptr);
            dm.ADO0744file_name.Value:=s;
            dm.ADO0744submit_date.Value:=now();
            dm.ADO0744flag.Value:=0;
            try
              dm.ADO0744.Post;
            except
              dm.ADO0744.Cancel;
              showmessage('新建文件目录失败');
            end;
            try
              dm.ADOTMP1.SQL.Clear;
              dm.ADOTMP1.SQL.Add('update FA0744 '+
                'set flag=1,file_data=:file_data_s from FA0744 where [file_name]= '''+
                s+''' and contract_rkey='+inttostr(dm.ADO0738Rkey.Value) );
              dm.ADOTMP1.Parameters.ParamByName('file_data_s').LoadFromStream(fs,ftBlob);
              dm.ADOTMP1.ExecSQL;
              dm.ADOTMP1.SQL.Clear;
              fs.Free;
              showmessage('文件上传成功,请勿点击保存');
            except
              dm.ADOTMP1.CancelUpdates;
              showmessage('文件上传失败');
              fs.Free;
            end;
            dm.ADO0744.Active:=false;
            dm.ADO0744.Active:=true;
            //file_name.Add(OpenDialog1.FileName+';'+'0');
          end;
      end;
      if s='' then showmessage('文件为空');
  end;

end;

procedure TFormNew.N11Click(Sender: TObject);
var
  filename,f: string;
  fs: TMemoryStream;
  begin
  dm.ADOTMP1.SQL.Clear;
  dm.ADOTMP1.SQL.Text:='select file_data from FA0744 where [file_name]='+
    quotedstr(dm.ADO0744file_name.AsString)+' and  contract_rkey='+inttostr(dm.ADO0738Rkey.Value);
  dm.adotmp1.Open;
  if dm.ADOTMP1.FieldByName('file_data').IsNull then
    begin
      showmessage('此文档为空');
      exit;
    end
  else
    begin
      fs:=TMemoryStream.Create;
      TBlobfield(dm.ADOTMP1.fieldbyname('file_data')).SaveToStream(fs);
      savedialog1.FileName:=dm.ADO0744file_name.AsString;
      SaveDialog1.Filter :='*.*';
      if SaveDialog1.Execute then
      begin
        UnPackStream(fs);
        f:=savedialog1.FileName;
        fs.SaveToFile(f);
        application.MessageBox('文件保存成功!','提示!',64);
      end;
      fs.Free;
      dm.ADOTMP1.Close;
      dm.ADOTMP1.SQL.Clear;
      // setfileattributes(pchar(f),FILE_ATTRIBUTE_READONLY);
    end;

    end;
procedure TFormNew.N12Click(Sender: TObject);
var
  f,k: string;
begin
  if MessageBox(Handle,'确定删除此文档吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
  f:=dm.ADO0744file_name.AsString;
  k:=inttostr(dm.ADO0738Rkey.Value);
  dm.ADOTMP1.SQL.Clear;
  dm.ADO0744.Active:=false;
  dm.ADO0738.Active:=false;
  dm.ADOTMP1.SQL.Text:='delete from   FA0744   from FA0744 where [file_name]='+quotedstr(f)+' and  contract_rkey='+k;
  dm.ADOTMP1.ExecSQL;
  dm.ADOTMP1.SQL.Text:='';
  dm.ADO0738.Active:=true;
  if not dm.ADO0738.IsEmpty then dm.ADO0744.Active:=true;

end;

end.


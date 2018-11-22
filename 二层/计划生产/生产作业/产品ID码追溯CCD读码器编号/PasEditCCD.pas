unit PasEditCCD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, DB, ADODB;

type
  TForm2 = class(TForm)
    Panel2: TPanel;
    btnExit: TBitBtn;
    btnQuery: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    DateTimePicker1: TDateTimePicker;
    BitBtn7: TBitBtn;
    BitBtn1: TBitBtn;
    Label7: TLabel;
    Edit6: TEdit;
    procedure btnExitClick(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Ftp:Integer;//0新增，1编辑
  end;

var
  Form2: TForm2;

implementation
uses PasDM,common,myclass,Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure TForm2.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure TForm2.BitBtn7Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'FASSET_CODE/设备代码/150,FASSET_NAME/设备名称/200,FASSET_DESC/规格型号/200';
    InputVar.Sqlstr :='select rkey,FASSET_CODE,FASSET_NAME,FASSET_DESC '+
                      'from Y1417 order by rkey';
    inputvar.KeyField:='rkey';
    InputVar.AdoConn:=dm.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Edit2.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['FASSET_CODE']);
      Edit2.Tag:=frmPick_Item_Single.adsPick.FieldValues['rkey'];
    end;
  finally
    frmPick_Item_Single.Free ;
  end;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'CODE/供应商代码/150,ABBR_NAME/供应商简称/250';
    InputVar.Sqlstr :='select rkey,CODE,ABBR_NAME '+
                      'from Data0023 order by rkey';
    inputvar.KeyField:='rkey';
    InputVar.AdoConn:=dm.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Edit4.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['ABBR_NAME']);
      Edit4.Tag:=frmPick_Item_Single.adsPick.FieldValues['rkey'];
    end;
  finally
    frmPick_Item_Single.Free ;
  end;
end;

procedure TForm2.btnQueryClick(Sender: TObject);
var tmpAdo:TADOQuery;
    iRkey,iNum:Integer;
begin
  if (Trim(Edit1.Text)='') then
  begin
    ShowMsg('读码器编号不能为空...',1);
    Edit1.SetFocus;
    Exit;
  end;
  if (Trim(Edit2.Text)='') then
  begin
    ShowMsg('请关联相关线别设备...',1);
    Edit2.SetFocus;
    Exit;
  end;
  iNum:=0;
  if (Ftp=0) then
  begin
    try
      try
        tmpAdo:=TADOQuery.Create(Application);
        tmpAdo.Connection:=dm.ADOConnection1;
        tmpAdo.Close;
        tmpAdo.SQL.Clear;
        tmpAdo.SQL.Text:='select * from Y1410 where ccd_code='''+Trim(Edit1.Text)+'''';
        tmpAdo.Open;
        if (not tmpAdo.IsEmpty) then
        begin
          ShowMsg('该读码器编号已经存在，请重新编号！',1);
          Exit;
        end;
        tmpAdo.Close;
        tmpAdo.SQL.Clear;
        tmpAdo.SQL.Text:='insert into Y1410 (ccd_code,y1417_rkey,ccd_sn,supplier,install,remark,IPaddress) '
        +'values (:ccd_code,:y1417_rkey,:ccd_sn,:supplier,:install,:remark,:IPaddress)';
        tmpAdo.Parameters.ParamByName('ccd_code').Value:=Trim(Edit1.Text);
        tmpAdo.Parameters.ParamByName('y1417_rkey').Value:=Edit2.Tag;
        tmpAdo.Parameters.ParamByName('ccd_sn').Value:=Trim(Edit3.Text);
        tmpAdo.Parameters.ParamByName('supplier').Value:=Trim(Edit4.Text);
        tmpAdo.Parameters.ParamByName('install').Value:=StrToDate(FormatDateTime('yyyy-MM-dd',DateTimePicker1.Date));
        tmpAdo.Parameters.ParamByName('remark').Value:=Trim(Edit5.Text);
        tmpAdo.Parameters.ParamByName('IPaddress').Value:=Trim(Edit6.Text);
        tmpAdo.ExecSQL;
        iNum:=1;
      except
        iNum:=0;
      end;
    finally
      tmpAdo.Close;
      tmpAdo.Connection:=nil;
      tmpAdo.Free;
    end;
    if (iNum>0) then
    begin
      ShowMsg('保存成功！',1);
      Edit1.SetFocus;
      Edit1.Text:='';
      Edit2.Text:='';
      Edit3.Text:='';
      Edit4.Text:='';
      Edit5.Text:='';
      DateTimePicker1.Date:=getsystem_date(DM.tmp,1);
      dm.Ado1410.Close;
      DM.Ado1410.SQL.Text:=DM.strSQLTxt+' where Y1410.install>='''+formatdatetime('yyyy-mm-dd ',DM.StartDate)+
                               ''' and Y1410.install<='''+formatdatetime('yyyy-mm-dd ',DM.EndDate)+''' order by Y1410.install desc';
      dm.Ado1410.Open;
    end;
  end;
  if (Ftp=1) then
  begin
    try
      try
        tmpAdo:=TADOQuery.Create(Application);
        tmpAdo.Connection:=dm.ADOConnection1;
        tmpAdo.Close;
        tmpAdo.SQL.Clear;
        tmpAdo.SQL.Text:='select * from Y1410 where Rkey='+IntToStr(Edit1.Tag);
        tmpAdo.Open;
        if (not tmpAdo.IsEmpty) then
        begin
          if tmpAdo.FieldByName('ccd_code').AsString<>Trim(Edit1.Text) then
          begin
            tmpAdo.Close;
            tmpAdo.SQL.Clear;
            tmpAdo.SQL.Text:='select * from Y1410 where ccd_code='''+Trim(Edit1.Text)+'''';
            tmpAdo.Open;
            if (not tmpAdo.IsEmpty) then
            begin
              ShowMsg('该读码器编号已经存在，请重新编号！',1);
              Exit;
            end;
          end;
          tmpAdo.Close;
          tmpAdo.SQL.Clear;
          tmpAdo.SQL.Text:='update Y1410 set ccd_code=:ccd_code,y1417_rkey=:y1417_rkey,ccd_sn=:ccd_sn,supplier=:supplier,install=:install,remark=:remark,IPaddress=:IPaddress where Rkey='+intTostr(Edit1.Tag);
          tmpAdo.Parameters.ParamByName('ccd_code').Value:=Trim(Edit1.Text);
          tmpAdo.Parameters.ParamByName('y1417_rkey').Value:=Edit2.Tag;
          tmpAdo.Parameters.ParamByName('ccd_sn').Value:=Trim(Edit3.Text);
          tmpAdo.Parameters.ParamByName('supplier').Value:=Trim(Edit4.Text);
          tmpAdo.Parameters.ParamByName('install').Value:=StrToDate(FormatDateTime('yyyy-MM-dd',DateTimePicker1.Date));
          tmpAdo.Parameters.ParamByName('remark').Value:=Trim(Edit5.Text);
          tmpAdo.Parameters.ParamByName('IPaddress').Value:=Trim(Edit6.Text);
          tmpAdo.ExecSQL;
        end;
        iNum:=1;
      except
        iNum:=0;
      end;
    finally
      tmpAdo.Close;
      tmpAdo.Connection:=nil;
      tmpAdo.Free;
    end;
    if (iNum>0) then
    begin
      ShowMsg('修改保存成功！',1);
      modalresult:=mrok;
    end;
  end;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  if (Ftp=0) then
  begin
    Edit1.SetFocus;
    Edit1.Text:='';
    Edit2.Text:='';
    Edit3.Text:='';
    Edit4.Text:='';
    Edit5.Text:='';
    Edit6.Text:='';
    DateTimePicker1.Date:=getsystem_date(DM.tmp,1);
  end else
  if (Ftp=1) then
  begin
    Edit1.Tag:=DM.Ado1410.FieldBYName('rkey').AsInteger;
    Edit1.Text:=DM.Ado1410.FieldByName('ccd_code').AsString;
    Edit2.Tag:=DM.Ado1410.FieldBYName('y1417_rkey').AsInteger;
    Edit2.Text:=DM.Ado1410.FieldByName('FASSET_CODE').AsString;
    Edit3.Text:=DM.Ado1410.FieldByName('ccd_sn').AsString;
    Edit4.Text:=DM.Ado1410.FieldByName('supplier').AsString;
    Edit5.Text:=DM.Ado1410.FieldByName('remark').AsString;
    Edit6.Text:=dm.Ado1410.FieldBYName('IPaddress').AsString;
    DateTimePicker1.Date:=StrToDate(FormatDateTime('yyyy-MM-dd',dm.Ado1410.FieldBYName('install').Value));
  end;
end;

end.

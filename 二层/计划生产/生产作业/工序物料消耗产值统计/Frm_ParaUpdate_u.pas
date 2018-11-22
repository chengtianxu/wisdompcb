unit Frm_ParaUpdate_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons,iniFiles, DB, ADODB;

type
  TCust = Record
    sIP:string;
    DBName:string;
    FCust:string;
  end;
  TFrm_ParaUpdate = class(TForm)
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    FiDept:string;
    FCust:Array[0..7] of TCust;
    FFormula:string;

    FDBCount:integer;
  public
    procedure init;
    function doUpdate(Con: TADOConnection;iTag:integer):boolean;
    class function UpdatePara(Formula:string;dept_ptr:string):boolean ;
  end;

var
  Frm_ParaUpdate: TFrm_ParaUpdate;

implementation
 uses DM_u;
{$R *.dfm}

{ TFrm_ParaUpdate }

procedure TFrm_ParaUpdate.init;
var F:TiniFile;
    i,iHt:integer;
    Sts: TStringlist;
begin
  try
    Sts:=TStringlist.Create;
    F:=TiniFile.Create(extractfilepath(Application.ExeName)+'WISDOMPCB.ini');
    F.ReadSection('服务器',sts);
    iHt:=(GroupBox1.Height-10) div (sts.Count+1);
    FDBCount:=sts.Count;
    for i:=0 to sts.Count-1  do
    begin
      with TCheckBox.Create(self) do
      begin
        parent:=GroupBox1;
        caption:=sts.Strings[i];
        tag:=i;
        left:=24;
        top:=iHt*(i+1)-height;
        checked:=true;
      end;
      FCust[i].sIP:=F.ReadString('服务器',sts.Strings[i],'');
      FCust[i].DBName:=F.ReadString('数据库',sts.Strings[i],'');
      FCust[i].FCust:=sts.Strings[i];
    end;
    with TCheckBox.Create(self) do     //非兄弟厂
    begin
      parent:=GroupBox1;
      caption:='其它';
      tag:=i;
      checked:=true;
      left:=24;
      top:=iHt*(i+1)-height;
      FCust[i].FCust:='其它';
    end;

  finally
    Sts.Free;
    F.Free;
  end;
end;

class function TFrm_ParaUpdate.UpdatePara(Formula:string;dept_ptr:string): boolean;
begin
  if DM.ADO571.IsEmpty then exit;
  with TFrm_ParaUpdate.Create(nil) do
  try
    FFormula:=Formula;
    FiDept:=dept_ptr;
    init;
    BitBtn1Click(nil);
//    result:=showmodal=mrok;
  finally
    free;
  end;
end;

procedure TFrm_ParaUpdate.BitBtn1Click(Sender: TObject);
var i,rec:integer;
begin
  screen.Cursor:=crSQLWait;
  DM.tmp.Close;
  DM.tmp.SQL.Text:='select * from data0569 where formula_number='''+Fformula+'''';
  DM.tmp.Open;
  rec:=DM.ADO571recno_number.AsInteger;
  if not DM.ADO572.Active then
  begin
    if Fistate=2 then  //edit
      DM.ADO572.Parameters[0].Value:=DM.ADO570RKEY.AsInteger
    else
      DM.ADO572.Parameters[0].Value:=-1;
    DM.ADO572.Open;
  end;

  for i:=0 to FDBCount do
  begin
    if TCheckBox(GroupBox1.Controls[i]).Checked then
    begin
      if (TCheckBox(GroupBox1.Controls[i]).Caption=sCust) or (TCheckBox(GroupBox1.Controls[i]).Caption='其它') then//本厂
        doUpdate(DM.ADOCon,GroupBox1.Controls[i].Tag)
      else
        doUpdate(DM.ADOCon1,GroupBox1.Controls[i].Tag) ;
    end;
  end;
  DM.ADO571.Locate('recno_number',rec,[]);
  screen.Cursor:=crDefault;
  modalresult:=mrok;
end;

function TFrm_ParaUpdate.doUpdate(Con: TADOConnection;iTag:integer): boolean;
var s,sP,sfld:string;
    i:integer;
begin
  result:=false;
  if FCust[iTag].FCust<>'其它' then
    DM.ADO571.Filter:='customer_name='''+FCust[iTag].FCust+''''
  else begin
    s:='';
    for i:=0 to FDBCount do
      if (FCust[i].FCust<>'其它') and (FCust[i].FCust<>'') then
        s:=s+'(customer_name<>'''+FCust[i].FCust+''') and ';
    DM.ADO571.Filter:=copy(s,1,length(s)-5);
  end;
  if not DM.ADO571.IsEmpty then
  begin
    if Con<>DM.ADOCon then //not本厂
    begin
      Con.Close;
      con.ConnectionString:='Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security Info=True;User ID=wzsa;'+
                            'Initial Catalog='+FCust[iTag].DBName+';Data Source='+FCust[iTag].sIp;
      con.Open;
    end;
  end else begin
    DM.ADO571.Filter:='';
    exit;
  end;
  DM.tmp1.Connection:=Con;
  DM.ADO571.DisableControls;
  DM.ADO571.First;
  while not DM.ADO571.Eof do
  begin
    DM.ADO571.Edit;
    for i:=0 to 9 do
    begin
      sfld:='PARA_PTR_'+inttostr(i);
      if not DM.tmp.fieldbyname(sfld).IsNull then
      begin
        DM.tmp1.Close;                                                                    //工序名称                                     //参数名称
        DM.tmp1.SQL.Text:='exec getParaVal '''+DM.ADO571MANU_PART_NUMBER.AsString+''','''+FiDept+''','''+DM.ADOPara.fieldbyname('pn'+inttostr(i)).AsString+'''';  //DM.ADO571.fieldbyname(sfld).AsString;
        DM.tmp1.Open ;
        if not DM.tmp1.IsEmpty and not DM.tmp1.fieldbyname('PARAMETER_VALUE').IsNull  then //产品无此参数
          DM.ADO571.FieldByName('PARA_VALUE_'+inttostr(i)).Value:=DM.tmp1.fieldbyname('PARAMETER_VALUE').AsString;  //取参数value
      end ;
    end;

    DM.tmp1.Close;
    DM.tmp1.SQL.Text:='SELECT isnull(data0279.PARAMETER_VALUE,0) PARAMETER_VALUE,dbo.Data0278.SPEC_RKEY,'+
                      'dbo.Data0025.MANU_PART_DESC,dbo.Data0025.ANALYSIS_CODE_1, dbo.Data0025.ANALYSIS_CODE_5,'+
                      'dbo.Data0025.set_lngth*dbo.Data0025.set_width * 0.000001 AS set_sq, dbo.Data0025.pcs_sq '+
                      'from data0025 inner join data0279 ON dbo.Data0279.SOURCE_PTR = dbo.Data0025.RKEY '+
                      'inner join data0278 ON dbo.Data0278.RKEY = dbo.Data0279.PARAMETER_PTR '+
                      'where data0025.MANU_PART_number='''+DM.ADO571MANU_PART_number.AsString+'''';
    DM.tmp1.Open ;
    if not DM.tmp1.IsEmpty then
    begin
      if DM.ADO571PANEL_A_B.Value='APNL' then
      begin
        if DM.tmp1.Locate('SPEC_RKEY','H',[]) then
          DM.ADO571pan_size.Value:=DM.tmp1.fieldbyname('PARAMETER_VALUE').AsString;   //A PNL size
        if DM.tmp1.Locate('SPEC_RKEY','6',[]) then
          DM.ADO571pan_sqrt.Value:=DM.tmp1.fieldbyname('PARAMETER_VALUE').AsFloat/1000000;
        if DM.tmp1.Locate('SPEC_RKEY','7',[]) then
          DM.ADO571pan_sqrt.Value:=DM.ADO571pan_sqrt.AsFloat*DM.tmp1.fieldbyname('PARAMETER_VALUE').AsFloat; //A PNL sqrt
      end else if DM.ADO571PANEL_A_B.Value='BPNL' then begin      //BPNL
        if DM.tmp1.Locate('SPEC_RKEY','I',[]) then
          DM.ADO571pan_size.Value:=DM.tmp1.fieldbyname('PARAMETER_VALUE').AsString;
        if DM.tmp1.Locate('SPEC_RKEY','8',[]) then
          DM.ADO571pan_sqrt.Value:=DM.tmp1.fieldbyname('PARAMETER_VALUE').AsFloat/1000000;
        if DM.tmp1.Locate('SPEC_RKEY','9',[]) then
          DM.ADO571pan_sqrt.Value:=DM.ADO571pan_sqrt.AsFloat*DM.tmp1.fieldbyname('PARAMETER_VALUE').AsFloat;
      end ;

      DM.ADO571MANU_PART_DESC.Value:=DM.tmp1.fieldbyname('MANU_PART_DESC').AsString;

      DM.ADO571set_size.Value:=DM.tmp1.fieldbyname('ANALYSIS_CODE_1').AsString;   //SET SIZE
      DM.ADO571set_sqrt.Value:=DM.tmp1.fieldbyname('set_sq').AsFloat;

      DM.ADO571pcs_size.Value:=DM.tmp1.fieldbyname('ANALYSIS_CODE_5').AsString;  //PCS SIZE
      DM.ADO571pcs_sqrt.Value:=DM.tmp1.fieldbyname('pcs_sq').AsFloat;

    end;
    DM.tmp1.Close;
    DM.ADO571.Post;
    DM.ADO571.Next;
  end;
  DM.ADO571.EnableControls;
  DM.ADO571.Filter:='';
  if Con<>DM.ADOCon then Con.Close; //not本厂
  result:=true;
end;

end.

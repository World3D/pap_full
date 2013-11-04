--Ѱ�����

--MisDescBegin
x207010_g_ScriptId = 207010
x207010_g_MissionIdPre =1
x207010_g_MissionId = 11
x207010_g_MissionKind = 1
x207010_g_ScriptIdNext = {ScriptId = 207011 ,LV = 1 }
x207010_g_Name	="����" 
x207010_g_Name2	="������" 

x207010_g_MissionName="Ѱ�����"
x207010_g_MissionInfo="    ��Щ#R������#W���ڰ����������ǣ�����Ȼ���Ǻܶ࣬���Ǹ������ĺ����������ָ߳������������ˣ����ҵ��ź�����ϣ�����ܹ����ң������Ƕ��������#GҰ����#W�ϣ����ǳ������ָߵĽ��ˣ�һ���������������������̫����������һ����ȥð�գ��������¸���#G������#W�������а취�ġ�"  --��������
x207010_g_MissionTarget="    Ѱ��#G������#W�İ���"		
x207010_g_MissionComplete="    #R������#W������Խ��Խ�����ˡ�������#GҰ����#WҲ������һ�������ϴ��ſֲ�����ߣ���������ɭɭ�ģ��ѵ���ĸ���˵�йأ�\n \nû�´�Ļ�����#R������#W����#R����#W���ٺ٣����ϳ���䵶��������ɱ������ɱ�������ǵģ����Ѿ��ŵ���Ѫ�ȵ���Ϣ���������������ǵ�Ƥ�����һ�����ǵĽ��������ҵ���������"					--�������npc˵���Ļ�
--������
x207010_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x207010_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x207010_g_RadioItemBonus={}

--MisDescEnd


--**********************************

--������ں���

--**********************************

function x207010_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x207010_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207010_g_MissionId) > 0 then
		if (GetName(sceneId,targetId)==x207010_g_Name2) then
                     	BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x207010_g_MissionName)
			AddText(sceneId,x207010_g_MissionComplete)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x207010_g_MissionTarget) 
			AddMoneyBonus(sceneId, x207010_g_MoneyBonus)	
			EndEvent()
			DispatchMissionContinueInfo(sceneId, selfId, targetId, x207010_g_ScriptId, x207010_g_MissionId)
		end
        elseif x207010_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x207010_g_MissionName)
                AddText(sceneId,x207010_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x207010_g_MissionTarget) 
		AddMoneyBonus(sceneId, x207010_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207010_g_ScriptId, x207010_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207010_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207010_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207010_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x207010_g_ScriptId, x207010_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x207010_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x207010_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207010_CheckPushList(sceneId, selfId, targetId)
        if (GetName(sceneId,targetId)==x207010_g_Name) then
                if IsHaveMission(sceneId,selfId, x207010_g_MissionId)<= 0 then
                    return 1
                end
        end
	if (GetName(sceneId,targetId)==x207010_g_Name2) then
		    if IsHaveMission(sceneId,selfId, x207010_g_MissionId) > 0 then
		    return 1
                    end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x207010_OnAccept(sceneId, selfId)

	--������������б�
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x207010_g_MissionId, x207010_g_ScriptId, 1, 0, 0)
	AddText(sceneId,"��������"..x207010_g_MissionName) 
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
end



--**********************************

--����

--**********************************

function x207010_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207010_g_MissionId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x207010_CheckSubmit( sceneId, selfId, targetId)

	if IsHaveMission(sceneId, selfId, x207010_g_MissionId) >= 0 then
		return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207010_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x207010_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x207010_g_MissionId)
		AddExp(sceneId, selfId, x207010_g_ExpBonus)
		AddMoney(sceneId, selfId, x207010_g_MoneyBonus)
		CallScriptFunction( x207010_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )

	end
	
end



--**********************************

--ɱ����������

--**********************************

function x207010_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x207010_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207010_OnItemChanged(sceneId, selfId, itemdataId)

end


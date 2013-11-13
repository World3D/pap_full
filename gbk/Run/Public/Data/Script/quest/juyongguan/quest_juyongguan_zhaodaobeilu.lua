--�ҵ���³

--MisDescBegin
x206004_g_ScriptId = 206004
x206004_g_MissionIdPre =30
x206004_g_MissionId = 31
x206004_g_MissionKind = 8
x206004_g_MissionLevel = 40
x206004_g_ScriptIdNext = {ScriptId = 206005 ,LV = 1 }
x206004_g_Name	="ľ����" 
x206004_g_Name2	="��³" 

x206004_g_MissionName="�ҵ���³"
x206004_g_MissionInfo="    #G��³#W���ҵ�һ�У�����С��ʧȥ�����裬��Ȼû��ĸ��������ȴ�ܶ��£���ô����������أ�\n \n    �������������ˣ����Ǽ����������˸������������о���һ����ս��������³�Ͱ������ˡ�\n \n    �⺢�Ӳ���ˣƢ���ģ�һ������ʲôԭ����ȥ�����չ��չ�����"  --��������
x206004_g_MissionTarget="    #G��³#W��Ը���������ȥ������Ϊʲô�����ˡ�"		
x206004_g_MissionComplete="    �����һ�ȥ������Ϊ�һ���ô��������һ������մ����Ѫ�������𣡺ߣ��Ҹ�����Ȼɱ�˺ܶ��ˣ�����ɱ�Ķ��ǽ��ˣ�����Ϊ���氳�ͺ��������ǳɼ�˼��������ɼ�˼��˵�����Դ����ˣ�һ�����������Դ��Լ����ֵܣ�һ��Ҫ���ݣ�\n \n    ���Ǿ�Ȼɱ�˹��������壡"					--�������npc˵���Ļ�
x206004_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x206004_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x206004_g_RadioItemBonus={}

--MisDescEnd
x206004_g_ExpBonus = 1000

--**********************************

--������ں���

--**********************************

function x206004_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x206004_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x206004_g_MissionId) > 0 then
		if (GetName(sceneId,targetId)==x206004_g_Name2) then
                     	BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x206004_g_MissionName)
			AddText(sceneId,x206004_g_MissionComplete)
		        AddMoneyBonus(sceneId, x206004_g_MoneyBonus)	
			EndEvent()
			DispatchMissionContinueInfo(sceneId, selfId, targetId, x206004_g_ScriptId, x206004_g_MissionId)
		end
        elseif x206004_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x206004_g_MissionName)
                AddText(sceneId,x206004_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x206004_g_MissionTarget) 
		AddMoneyBonus(sceneId, x206004_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x206004_g_ScriptId, x206004_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x206004_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x206004_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x206004_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x206004_g_ScriptId, x206004_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x206004_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x206004_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x206004_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==6) then
        	if IsMissionHaveDone(sceneId, selfId, x206004_g_MissionIdPre) > 0 then
        		if (GetName(sceneId,targetId)==x206004_g_Name) then
        		        if IsHaveMission(sceneId,selfId, x206004_g_MissionId)<= 0 then
        		            return 1
        		        end
        		elseif (GetName(sceneId,targetId)==x206004_g_Name2) then
				    if IsHaveMission(sceneId,selfId, x206004_g_MissionId) > 0 then
				    return 1
        		            end
        		end
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x206004_OnAccept(sceneId, selfId)

	--������������б�
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x206004_g_MissionId, x206004_g_ScriptId, 1, 0, 0)
	AddText(sceneId,"��������"..x206004_g_MissionName) 
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
end



--**********************************

--����

--**********************************

function x206004_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x206004_g_MissionId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x206004_CheckSubmit( sceneId, selfId, targetId)

	if IsHaveMission(sceneId, selfId, x206004_g_MissionId) >= 0 then
		return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x206004_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x206004_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x206004_g_MissionId)
		AddExp(sceneId, selfId, x206004_g_ExpBonus)
		AddMoney(sceneId, selfId, x206004_g_MoneyBonus)
		for i, item in pairs(x206004_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end
	        CallScriptFunction( x206004_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )

	end
	
end



--**********************************

--ɱ����������

--**********************************

function x206004_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x206004_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x206004_OnItemChanged(sceneId, selfId, itemdataId)

end


--ѯ�ʰ�����

--MisDescBegin
x207012_g_ScriptId = 207012
x207012_g_MissionIdPre =12
x207012_g_MissionId = 13
x207012_g_MissionKind = 1
x207012_g_ScriptIdNext = {ScriptId = 207013 ,LV = 1 }
x207012_g_Name	="������" 
x207012_g_Name2	="������" 

x207012_g_MissionName="ѯ�ʰ�����"
x207012_g_MissionInfo="    ����ʵ�����̫�أ����ҵ�Сų�������ǰ���������һ��������ߣ�������������Ŀʾ�ˡ���Щ������ߵ��ˣ����˳�Ϊ�����͡���#R����#WΪ�ʵ۱����ɳ�ȥ�Ĵ󳼣�Ҳ��ල��Щ�󳼣�������������֮�ġ������ɴ����ӹ���ܵĻʵۣ�ע����Ҫ�������\n \n    ��Щ#R����#W��#GҰ����#W��û�����ߣ�һ����ʲôĿ�ġ���\n \n    �����ҪΪ����һ�ˣ�����²Ӫ������Ӫ�Ľ���#G������#W�������ܲ��ܴ�Ͷ����Ұ�����ؽ�#G����#W�����ͳ���ʲô�� "  --��������
x207012_g_MissionTarget="    ����²ӪѰ��#G������#W"		
x207012_g_MissionComplete="    �ޣ��������ӣ�������ȥ���#G������#W������û�뵽�����������ˣ��ţ�������Ŀ�����Ѿ�֪���ˣ�������������˴����⡭�����ң��ң��Һܵ��ģ�\n \n    ������ܾ����������飬���룬�����Ҫȥ��������~���ҿɲ�����ô������������žͿ����ˣ�������Σ���һ��Ҫ������취�����Ҳ��뻹û�����ҵĺ��Ӿ͡���"					--�������npc˵���Ļ�
--������
x207012_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x207012_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x207012_g_RadioItemBonus={}

--MisDescEnd


--**********************************

--������ں���

--**********************************

function x207012_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x207012_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207012_g_MissionId) > 0 then
		if (GetName(sceneId,targetId)==x207012_g_Name2) then
                     	BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x207012_g_MissionName)
			AddText(sceneId,x207012_g_MissionComplete)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x207012_g_MissionTarget) 
			AddMoneyBonus(sceneId, x207012_g_MoneyBonus)	
			EndEvent()
			DispatchMissionContinueInfo(sceneId, selfId, targetId, x207012_g_ScriptId, x207012_g_MissionId)
		end
        elseif x207012_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x207012_g_MissionName)
                AddText(sceneId,x207012_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x207012_g_MissionTarget) 
		AddMoneyBonus(sceneId, x207012_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207012_g_ScriptId, x207012_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207012_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207012_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207012_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x207012_g_ScriptId, x207012_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x207012_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x207012_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207012_CheckPushList(sceneId, selfId, targetId)
	if IsMissionHaveDone(sceneId, selfId, x207012_g_MissionIdPre) > 0 then
        	if (GetName(sceneId,targetId)==x207012_g_Name) then
                	if IsHaveMission(sceneId,selfId, x207012_g_MissionId)<= 0 then
                   	 return 1
                	end
        	end
		if (GetName(sceneId,targetId)==x207012_g_Name2) then
		    	if IsHaveMission(sceneId,selfId, x207012_g_MissionId) > 0 then
		    	return 1
                    	end
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x207012_OnAccept(sceneId, selfId)

	--������������б�
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x207012_g_MissionId, x207012_g_ScriptId, 1, 0, 0)
	AddText(sceneId,"��������"..x207012_g_MissionName) 
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
end



--**********************************

--����

--**********************************

function x207012_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207012_g_MissionId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x207012_CheckSubmit( sceneId, selfId, targetId)

	if IsHaveMission(sceneId, selfId, x207012_g_MissionId) >= 0 then
		return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207012_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x207012_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x207012_g_MissionId)
		AddExp(sceneId, selfId, x207012_g_ExpBonus)
		AddMoney(sceneId, selfId, x207012_g_MoneyBonus)
		CallScriptFunction( x207012_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )

	end
	
end



--**********************************

--ɱ����������

--**********************************

function x207012_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x207012_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207012_OnItemChanged(sceneId, selfId, itemdataId)

end

